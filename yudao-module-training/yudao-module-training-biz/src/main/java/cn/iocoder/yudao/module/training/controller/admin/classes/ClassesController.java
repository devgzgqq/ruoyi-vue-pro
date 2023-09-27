package cn.iocoder.yudao.module.training.controller.admin.classes;

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

import cn.iocoder.yudao.module.training.controller.admin.classes.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.classes.ClassesDO;
import cn.iocoder.yudao.module.training.convert.classes.ClassesConvert;
import cn.iocoder.yudao.module.training.service.classes.ClassesService;

@Tag(name = "管理后台 - 班级信息")
@RestController
@RequestMapping("/training/classes")
@Validated
public class ClassesController {

    @Resource
    private ClassesService classesService;

    @PostMapping("/create")
    @Operation(summary = "创建班级信息")
    @PreAuthorize("@ss.hasPermission('training:classes:create')")
    public CommonResult<Long> createClasses(@Valid @RequestBody ClassesCreateReqVO createReqVO) {
        return success(classesService.createClasses(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新班级信息")
    @PreAuthorize("@ss.hasPermission('training:classes:update')")
    public CommonResult<Boolean> updateClasses(@Valid @RequestBody ClassesUpdateReqVO updateReqVO) {
        classesService.updateClasses(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除班级信息")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('training:classes:delete')")
    public CommonResult<Boolean> deleteClasses(@RequestParam("id") Long id) {
        classesService.deleteClasses(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得班级信息")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('training:classes:query')")
    public CommonResult<ClassesRespVO> getClasses(@RequestParam("id") Long id) {
        ClassesDO classes = classesService.getClasses(id);
        return success(ClassesConvert.INSTANCE.convert(classes));
    }

    @GetMapping("/list")
    @Operation(summary = "获得班级信息列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('training:classes:query')")
    public CommonResult<List<ClassesRespVO>> getClassesList(@RequestParam("ids") Collection<Long> ids) {
        List<ClassesDO> list = classesService.getClassesList(ids);
        return success(ClassesConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得班级信息分页")
    @PreAuthorize("@ss.hasPermission('training:classes:query')")
    public CommonResult<PageResult<ClassesRespVO>> getClassesPage(@Valid ClassesPageReqVO pageVO) {
        PageResult<ClassesDO> pageResult = classesService.getClassesPage(pageVO);
        return success(ClassesConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出班级信息 Excel")
    @PreAuthorize("@ss.hasPermission('training:classes:export')")
    @OperateLog(type = EXPORT)
    public void exportClassesExcel(@Valid ClassesExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<ClassesDO> list = classesService.getClassesList(exportReqVO);
        // 导出 Excel
        List<ClassesExcelVO> datas = ClassesConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "班级信息.xls", "数据", ClassesExcelVO.class, datas);
    }

}
