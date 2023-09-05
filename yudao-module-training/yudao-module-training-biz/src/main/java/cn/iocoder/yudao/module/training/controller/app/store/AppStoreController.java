package cn.iocoder.yudao.module.training.controller.app.store;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;
import cn.iocoder.yudao.framework.operatelog.core.annotations.OperateLog;
import cn.iocoder.yudao.module.training.convert.store.StoreConvert;
import cn.iocoder.yudao.module.training.dal.dataobject.store.StoreDO;
import cn.iocoder.yudao.module.training.service.store.StoreService;
import cn.iocoder.yudao.module.training.vo.store.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;
import static cn.iocoder.yudao.framework.operatelog.core.enums.OperateTypeEnum.EXPORT;

@Tag(name = "用户 APP - 门店")
@RestController
@RequestMapping("/training/store")
@Validated
public class AppStoreController {

    @Resource
    private StoreService storeService;

    @PostMapping("/create")
    @Operation(summary = "创建门店")

    public CommonResult<Long> createStore(@Valid @RequestBody StoreCreateReqVO createReqVO) {
        return success(storeService.createStore(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新门店")

    public CommonResult<Boolean> updateStore(@Valid @RequestBody StoreUpdateReqVO updateReqVO) {
        storeService.updateStore(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除门店")
    @Parameter(name = "id", description = "编号", required = true)

    public CommonResult<Boolean> deleteStore(@RequestParam("id") Long id) {
        storeService.deleteStore(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得门店")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")

    public CommonResult<StoreRespVO> getStore(@RequestParam("id") Long id) {
        StoreDO store = storeService.getStore(id);
        return success(StoreConvert.INSTANCE.convert(store));
    }

    @GetMapping("/list")
    @Operation(summary = "获得门店列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")

    public CommonResult<List<StoreRespVO>> getStoreList(@RequestParam("ids") Collection<Long> ids) {
        List<StoreDO> list = storeService.getStoreList(ids);
        return success(StoreConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得门店分页")

    public CommonResult<PageResult<StoreRespVO>> getStorePage(@Valid StorePageReqVO pageVO) {
        PageResult<StoreDO> pageResult = storeService.getStorePage(pageVO);
        return success(StoreConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出门店 Excel")

    @OperateLog(type = EXPORT)
    public void exportStoreExcel(@Valid StoreExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<StoreDO> list = storeService.getStoreList(exportReqVO);
        // 导出 Excel
        List<StoreExcelVO> datas = StoreConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "门店.xls", "数据", StoreExcelVO.class, datas);
    }

}
