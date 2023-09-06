package cn.iocoder.yudao.module.training.controller.admin.coach.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 教练 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class CoachRespVO extends CoachBaseVO {

    @Schema(description = "教练编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "6715")
    private Long id;

    @Schema(description = "创建时间", requiredMode = Schema.RequiredMode.REQUIRED)
    private LocalDateTime createTime;

}
