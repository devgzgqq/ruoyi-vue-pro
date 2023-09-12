package cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import javax.validation.constraints.*;

@Schema(description = "管理后台 - 顾问更新 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class SalespersonUpdateReqVO extends SalespersonBaseVO {

    @Schema(description = "顾问编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "5350")
    @NotNull(message = "顾问编号不能为空")
    private Long id;

}
