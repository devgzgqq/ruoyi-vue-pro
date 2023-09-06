package cn.iocoder.yudao.module.training.controller.admin.student.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 学员 Excel 导出 Request VO，参数和 StudentPageReqVO 是一致的")
@Data
public class StudentExportReqVO {

    @Schema(description = "门店ID", example = "10770")
    private Long storeId;

    @Schema(description = "教练ID", example = "464")
    private Long coachId;

    @Schema(description = "会员ID", example = "9654")
    private Long memberId;

    @Schema(description = "姓名", example = "芋艿")
    private String name;

    @Schema(description = "头像")
    private String avatar;

    @Schema(description = "状态", example = "2")
    private Boolean status;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

}
