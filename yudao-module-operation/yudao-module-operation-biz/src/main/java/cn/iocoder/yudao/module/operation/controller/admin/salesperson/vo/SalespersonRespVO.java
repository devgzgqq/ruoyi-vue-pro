package cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 顾问 Response VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class SalespersonRespVO extends SalespersonBaseVO {

    @Schema(description = "顾问编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "5350")
    private Long id;

    @Schema(description = "创建时间", requiredMode = Schema.RequiredMode.REQUIRED)
    private LocalDateTime createTime;

}
