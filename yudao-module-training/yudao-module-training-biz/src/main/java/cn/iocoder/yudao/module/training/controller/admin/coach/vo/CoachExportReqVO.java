package cn.iocoder.yudao.module.training.controller.admin.coach.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 教练 Excel 导出 Request VO，参数和 CoachPageReqVO 是一致的")
@Data
public class CoachExportReqVO {

    @Schema(description = "教练名称", example = "王五")
    private String name;

    @Schema(description = "教练手机号")
    private String mobile;

    @Schema(description = "教练级别")
    private String level;

    @Schema(description = "状态", example = "2")
    private Boolean status;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

}
