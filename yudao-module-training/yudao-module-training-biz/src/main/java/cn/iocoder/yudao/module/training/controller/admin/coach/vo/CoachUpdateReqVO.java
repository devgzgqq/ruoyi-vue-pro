package cn.iocoder.yudao.module.training.controller.admin.coach.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import javax.validation.constraints.*;

@Schema(description = "管理后台 - 教练更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class CoachUpdateReqVO extends CoachBaseVO {

    @Schema(description = "教练编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "6715")
    @NotNull(message = "教练编号不能为空")
    private Long id;

}
