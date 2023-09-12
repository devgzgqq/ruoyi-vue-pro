package cn.iocoder.yudao.module.operation.controller.admin.salesperson;

import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import org.springframework.validation.annotation.Validated;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Operation;

import javax.validation.constraints.*;
import javax.validation.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.IOException;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;

import cn.iocoder.yudao.framework.operatelog.core.annotations.OperateLog;
import static cn.iocoder.yudao.framework.operatelog.core.enums.OperateTypeEnum.*;

import cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo.*;
import cn.iocoder.yudao.module.operation.dal.dataobject.salesperson.SalespersonDO;
import cn.iocoder.yudao.module.operation.convert.salesperson.SalespersonConvert;
import cn.iocoder.yudao.module.operation.service.salesperson.SalespersonService;

@Tag(name = "管理后台 - 顾问")
@RestController
@RequestMapping("/operation/salesperson")
@Validated
public class SalespersonController {

    @Resource
    private SalespersonService salespersonService;

    @PostMapping("/create")
    @Operation(summary = "创建顾问")
    @PreAuthorize("@ss.hasPermission('operation:salesperson:create')")
    public CommonResult<Long> createSalesperson(@Valid @RequestBody SalespersonCreateReqVO createReqVO) {
        return success(salespersonService.createSalesperson(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新顾问")
    @PreAuthorize("@ss.hasPermission('operation:salesperson:update')")
    public CommonResult<Boolean> updateSalesperson(@Valid @RequestBody SalespersonUpdateReqVO updateReqVO) {
        salespersonService.updateSalesperson(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除顾问")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('operation:salesperson:delete')")
    public CommonResult<Boolean> deleteSalesperson(@RequestParam("id") Long id) {
        salespersonService.deleteSalesperson(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得顾问")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('operation:salesperson:query')")
    public CommonResult<SalespersonRespVO> getSalesperson(@RequestParam("id") Long id) {
        SalespersonDO salesperson = salespersonService.getSalesperson(id);
        return success(SalespersonConvert.INSTANCE.convert(salesperson));
    }

    @GetMapping("/list")
    @Operation(summary = "获得顾问列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('operation:salesperson:query')")
    public CommonResult<List<SalespersonRespVO>> getSalespersonList(@RequestParam("ids") Collection<Long> ids) {
        List<SalespersonDO> list = salespersonService.getSalespersonList(ids);
        return success(SalespersonConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得顾问分页")
    @PreAuthorize("@ss.hasPermission('operation:salesperson:query')")
    public CommonResult<PageResult<SalespersonRespVO>> getSalespersonPage(@Valid SalespersonPageReqVO pageVO) {
        PageResult<SalespersonDO> pageResult = salespersonService.getSalespersonPage(pageVO);
        return success(SalespersonConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出顾问 Excel")
    @PreAuthorize("@ss.hasPermission('operation:salesperson:export')")
    @OperateLog(type = EXPORT)
    public void exportSalespersonExcel(@Valid SalespersonExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<SalespersonDO> list = salespersonService.getSalespersonList(exportReqVO);
        // 导出 Excel
        List<SalespersonExcelVO> datas = SalespersonConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "顾问.xls", "数据", SalespersonExcelVO.class, datas);
    }

}
