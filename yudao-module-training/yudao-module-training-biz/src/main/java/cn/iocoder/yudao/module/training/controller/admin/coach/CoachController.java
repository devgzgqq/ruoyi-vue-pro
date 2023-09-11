package cn.iocoder.yudao.module.training.controller.admin.coach;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.excel.core.util.ExcelUtils;
import cn.iocoder.yudao.framework.operatelog.core.annotations.OperateLog;
import cn.iocoder.yudao.module.system.api.user.AdminUserApi;
import cn.iocoder.yudao.module.system.api.user.dto.AdminUserCreateReqDTO;
import cn.iocoder.yudao.module.system.api.user.dto.AdminUserRespDTO;
import cn.iocoder.yudao.module.training.controller.admin.coach.vo.*;
import cn.iocoder.yudao.module.training.convert.coach.CoachConvert;
import cn.iocoder.yudao.module.training.dal.dataobject.coach.CoachDO;
import cn.iocoder.yudao.module.training.service.coach.CoachService;
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
import java.util.Collection;
import java.util.List;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;
import static cn.iocoder.yudao.framework.operatelog.core.enums.OperateTypeEnum.EXPORT;

@Tag(name = "管理后台 - 教练")
@RestController
@RequestMapping("/training/coach")
@Validated
public class CoachController {

    @Resource
    private CoachService coachService;

    @Resource
    private AdminUserApi adminUserApi;

    @PostMapping("/create")
    @Operation(summary = "创建教练")
    @PreAuthorize("@ss.hasPermission('training:coach:create')")
    public CommonResult<Long> createCoach(@Valid @RequestBody CoachCreateReqVO createReqVO) {
        return success(coachService.createCoach(createReqVO));
    }

    @PostMapping("/create-user")
    @Operation(summary = "创建用户")
    @PreAuthorize("@ss.hasPermission('training:coach:create')")
    public CommonResult<Long> createUser(@Valid @RequestBody CoachUpdateReqVO updateReqVO) {
        AdminUserCreateReqDTO createReqDTO = new AdminUserCreateReqDTO();
        createReqDTO.setNickname(updateReqVO.getNickname());
        AdminUserRespDTO user = adminUserApi.createUser(createReqDTO);
        updateReqVO.setUserId(user.getId());
        coachService.updateCoach(updateReqVO);
        return success(user.getId());
    }

    @PutMapping("/update")
    @Operation(summary = "更新教练")
    @PreAuthorize("@ss.hasPermission('training:coach:update')")
    public CommonResult<Boolean> updateCoach(@Valid @RequestBody CoachUpdateReqVO updateReqVO) {
        coachService.updateCoach(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除教练")
    @Parameter(name = "id", description = "编号", required = true)
    @PreAuthorize("@ss.hasPermission('training:coach:delete')")
    public CommonResult<Boolean> deleteCoach(@RequestParam("id") Long id) {
        coachService.deleteCoach(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得教练")
    @Parameter(name = "id", description = "编号", required = true, example = "1024")
    @PreAuthorize("@ss.hasPermission('training:coach:query')")
    public CommonResult<CoachRespVO> getCoach(@RequestParam("id") Long id) {
        CoachDO coach = coachService.getCoach(id);
        return success(CoachConvert.INSTANCE.convert(coach));
    }

    @GetMapping("/list")
    @Operation(summary = "获得教练列表")
    @Parameter(name = "ids", description = "编号列表", required = true, example = "1024,2048")
    @PreAuthorize("@ss.hasPermission('training:coach:query')")
    public CommonResult<List<CoachRespVO>> getCoachList(@RequestParam("ids") Collection<Long> ids) {
        List<CoachDO> list = coachService.getCoachList(ids);
        return success(CoachConvert.INSTANCE.convertList(list));
    }

    @GetMapping("/page")
    @Operation(summary = "获得教练分页")
    @PreAuthorize("@ss.hasPermission('training:coach:query')")
    public CommonResult<PageResult<CoachRespVO>> getCoachPage(@Valid CoachPageReqVO pageVO) {
        PageResult<CoachDO> pageResult = coachService.getCoachPage(pageVO);
        return success(CoachConvert.INSTANCE.convertPage(pageResult));
    }

    @GetMapping("/export-excel")
    @Operation(summary = "导出教练 Excel")
    @PreAuthorize("@ss.hasPermission('training:coach:export')")
    @OperateLog(type = EXPORT)
    public void exportCoachExcel(@Valid CoachExportReqVO exportReqVO,
              HttpServletResponse response) throws IOException {
        List<CoachDO> list = coachService.getCoachList(exportReqVO);
        // 导出 Excel
        List<CoachExcelVO> datas = CoachConvert.INSTANCE.convertList02(list);
        ExcelUtils.write(response, "教练.xls", "数据", CoachExcelVO.class, datas);
    }

}
