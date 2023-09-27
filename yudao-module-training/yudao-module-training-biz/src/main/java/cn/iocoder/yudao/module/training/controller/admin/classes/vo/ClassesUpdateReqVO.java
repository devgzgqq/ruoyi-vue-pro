package cn.iocoder.yudao.module.training.controller.admin.classes.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import javax.validation.constraints.*;

@Schema(description = "管理后台 - 班级信息更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ClassesUpdateReqVO extends ClassesBaseVO {

    @Schema(description = "班级ID", requiredMode = Schema.RequiredMode.REQUIRED, example = "14494")
    @NotNull(message = "班级ID不能为空")
    private Long id;

}
