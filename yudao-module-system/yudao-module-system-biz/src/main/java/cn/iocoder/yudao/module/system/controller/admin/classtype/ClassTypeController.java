package cn.iocoder.yudao.module.system.controller.admin.classtype;

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

import cn.iocoder.yudao.module.system.controller.admin.classtype.vo.*;
import cn.iocoder.yudao.module.system.dal.dataobject.classtype.ClassTypeDO;
import cn.iocoder.yudao.module.system.convert.classtype.ClassTypeConvert;
import cn.iocoder.yudao.module.system.service.classtype.ClassTypeService;

@Tag(name = "管理后台 - 类型")
@RestController
@RequestMapping("/system/class-type")
@Validated
public class ClassTypeController {

    @Resource
    private ClassTypeService classTypeService;

    @PostMapping("/create")
    @Operation(summary = "创建类型")
    @PreAuthorize("@ss.hasPermission('system:class-type:create')")
    public CommonResult<Long> createClassType(@Valid @RequestBody ClassTypeCreateReqVO createReqVO) {
        return success(classTypeService.createClassType(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新类型")
    @PreAuthorize("@ss.hasPermission('system:class-type:update')")
    public CommonResult<Boolean> updateClassType(@Valid @RequestBody ClassTypeUpdateReqVO updateReqVO) {
        classTypeService.updateClassType(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除类型")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('system:class-type:delete')")
    public CommonResult<Boolean> deleteClassType(@RequestParam("id") Long id) {
        classTypeService.deleteClassType(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得类型")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('system:class-type:query')")
    public CommonResult<ClassTypeRespVO> getClassType(@RequestParam("id") Long id) {
        ClassTypeDO classType = classTypeService.getClassType(id);
        return success(ClassTypeConvert.INSTANCE.convert(classType));
    }

    @GetMapping("/list")
    @Operation(summary = "获得类型列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('system:class-type:query')")
    public CommonResult<List<ClassTypeRespVO>> getClassTypeList(@RequestParam("ids") Collection<Long> ids) {
        List<ClassTypeDO> list = classTypeService.getClassTypeList(ids);
        return success(ClassTypeConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得类型分页")
    @PreAuthorize("@ss.hasPermission('system:class-type:query')")
    public CommonResult<PageResult<ClassTypeRespVO>> getClassTypePage(@Valid ClassTypePageReqVO pageVO) {
        PageResult<ClassTypeDO> pageResult = classTypeService.getClassTypePage(pageVO);
        return success(ClassTypeConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出类型 Excel")
    @PreAuthorize("@ss.hasPermission('system:class-type:export')")
    @OperateLog(type = EXPORT)
    public void exportClassTypeExcel(@Valid ClassTypeExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<ClassTypeDO> list = classTypeService.getClassTypeList(exportReqVO);
        // 导出 Excel
        List<ClassTypeExcelVO> datas = ClassTypeConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "类型.xls", "数据", ClassTypeExcelVO.class, datas);
    }

}
