package cn.iocoder.yudao.module.system.controller.admin.classtype.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import javax.validation.constraints.*;

@Schema(description = "管理后台 - 类型更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ClassTypeUpdateReqVO extends ClassTypeBaseVO {

    @Schema(description = "编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "8887")
    @NotNull(message = "编号不能为空")
    private Long id;

}
