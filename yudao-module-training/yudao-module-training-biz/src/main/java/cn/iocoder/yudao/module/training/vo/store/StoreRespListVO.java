package cn.iocoder.yudao.module.training.vo.store;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 门店 Response VO")
@Data
@ToString(callSuper = true)
public class StoreRespListVO {

    @Schema(description = "门店编号", requiredMode = Schema.RequiredMode.REQUIRED, example = "20673")
    private Long id;

    @Schema(description = "门店名称", requiredMode = Schema.RequiredMode.REQUIRED, example = "李四")
    @NotNull(message = "门店名称不能为空")
    private String name;

    @Schema(description = "门店手机号")
    private String mobile;

    @Schema(description = "门店地址")
    private String address;

    @Schema(description = "营业时间")
    private String businessHours;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "门店状态", example = "1")
    private Boolean status;

    @Schema(description = "是否推荐")
    private Boolean recommend;

    @Schema(description = "创建者")
    private String creator;

    @Schema(description = "创建时间", requiredMode = Schema.RequiredMode.REQUIRED)
    private LocalDateTime createTime;
}
