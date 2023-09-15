package cn.iocoder.yudao.module.training.controller.admin.student;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;
import cn.iocoder.yudao.framework.operatelog.core.annotations.OperateLog;
import cn.iocoder.yudao.module.member.api.user.MemberUserApi;
import cn.iocoder.yudao.module.member.api.user.dto.MemberUserRespDTO;
import cn.iocoder.yudao.module.system.api.user.AdminUserApi;
import cn.iocoder.yudao.module.system.api.user.dto.AdminUserRespDTO;
import cn.iocoder.yudao.module.training.controller.admin.student.vo.*;
import cn.iocoder.yudao.module.training.convert.student.StudentConvert;
import cn.iocoder.yudao.module.training.dal.dataobject.store.StoreDO;
import cn.iocoder.yudao.module.training.dal.dataobject.student.StudentDO;
import cn.iocoder.yudao.module.training.service.store.StoreService;
import cn.iocoder.yudao.module.training.service.student.StudentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;
import static cn.iocoder.yudao.framework.common.util.collection.CollectionUtils.convertList;
import static cn.iocoder.yudao.framework.operatelog.core.enums.OperateTypeEnum.EXPORT;

@Tag(name = "管理后台 - 学员")
@RestController
@RequestMapping("/training/student")
@Validated
public class StudentController {

    @Resource
    private StudentService studentService;

    @Resource
    private StoreService storeService;

    @Resource
    private AdminUserApi adminUserApi;

    @Resource
    private MemberUserApi memberUserApi;

    @PostMapping("/create")
    @Operation(summary = "创建学员")
    @PreAuthorize("@ss.hasPermission('training:student:create')")
    public CommonResult<Long> createStudent(@Valid @RequestBody StudentCreateReqVO createReqVO) {
        return success(studentService.createStudent(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新学员")
    @PreAuthorize("@ss.hasPermission('training:student:update')")
    public CommonResult<Boolean> updateStudent(@Valid @RequestBody StudentUpdateReqVO updateReqVO) {
        studentService.updateStudent(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除学员")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('training:student:delete')")
    public CommonResult<Boolean> deleteStudent(@RequestParam("id") Long id) {
        studentService.deleteStudent(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得学员")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('training:student:query')")
    public CommonResult<StudentRespVO> getStudent(@RequestParam("id") Long id) {
        StudentDO student = studentService.getStudent(id);
        return success(StudentConvert.INSTANCE.convert(student));
    }

    @GetMapping("/list")
    @Operation(summary = "获得学员列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('training:student:query')")
    public CommonResult<List<StudentRespVO>> getStudentList(@RequestParam("ids") Collection<Long> ids) {
        List<StudentDO> list = studentService.getStudentList(ids);
        return success(StudentConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得学员分页")
    @PreAuthorize("@ss.hasPermission('training:student:query')")
    public CommonResult<PageResult<StudentRespVO>> getStudentPage(@Valid StudentPageReqVO pageVO) {
        PageResult<StudentDO> pageResult = studentService.getStudentPage(pageVO);
        if(CollUtil.isEmpty(pageResult.getList())) {
            return success(new PageResult<>(pageResult.getTotal()));
        }

        List<Long> storeIds = convertList(pageResult.getList(), StudentDO::getStoreId);
        List<Long> coachIds = convertList(pageResult.getList(), StudentDO::getCoachId);
        List<Long> memberIds = convertList(pageResult.getList(), StudentDO::getMemberId);

        // 获得门店 Map
        Map<Long, StoreDO> storeMap = storeService.getStoreMap(storeIds);
        // 获得教练 Map
        Map<Long, AdminUserRespDTO> userMap = adminUserApi.getUserMap(coachIds);
        // 获得会员 Map
        Map<Long, MemberUserRespDTO> memberMap = memberUserApi.getUserMap(memberIds);

        ArrayList<StudentRespVO> studentRespVOs = new ArrayList<>(pageResult.getList().size());

        pageResult.getList().forEach(student -> {
            StudentRespVO respVO = StudentConvert.INSTANCE.convert(student);
            if(ObjectUtil.isNotEmpty(student.getStoreId())) {
                respVO.setStoreName(storeMap.get(student.getStoreId()).getName());
            }
            if (ObjectUtil.isNotEmpty(student.getCoachId())) {
                respVO.setCoachName(userMap.get(student.getCoachId()).getNickname());
            }
            if(ObjectUtil.isNotEmpty(student.getMemberId()) && ObjectUtil.isNotEmpty(memberMap.get(student.getMemberId()))) {
                respVO.setMemberName(memberMap.get(student.getMemberId()).getName());
            }
            studentRespVOs.add(respVO);
        });

        return success(new PageResult<>(studentRespVOs, pageResult.getTotal()));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出学员 Excel")
    @PreAuthorize("@ss.hasPermission('training:student:export')")
    @OperateLog(type = EXPORT)
    public void exportStudentExcel(@Valid StudentExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<StudentDO> list = studentService.getStudentList(exportReqVO);
        // 导出 Excel
        List<StudentExcelVO> datas = StudentConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "学员.xls", "数据", StudentExcelVO.class, datas);
    }

}
