package cn.iocoder.yudao.module.training.controller.admin.classes.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 班级信息 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ClassesRespVO extends ClassesBaseVO {

    @Schema(description = "班级ID", requiredMode = Schema.RequiredMode.REQUIRED, example = "14494")
    private Long id;

    @Schema(description = "创建时间", requiredMode = Schema.RequiredMode.REQUIRED)
    private LocalDateTime createTime;

}
