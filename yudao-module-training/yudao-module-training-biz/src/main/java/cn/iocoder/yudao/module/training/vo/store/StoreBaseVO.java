package cn.iocoder.yudao.module.training.vo.store;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 门店 Base VO，提供给添加、修改、详细的子 VO 使用
 * 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
 */
@Data
public class StoreBaseVO {

    @Schema(description = "门店名称", requiredMode = Schema.RequiredMode.REQUIRED, example = "李四")
    @NotNull(message = "门店名称不能为空")
    private String name;

    @Schema(description = "门店手机号")
    private String mobile;

    @Schema(description = "门店地址")
    private String address;

    @Schema(description = "经度")
    private String longitude;

    @Schema(description = "纬度")
    private String latitude;

    @Schema(description = "门店logo")
    private String logo;

    @Schema(description = "门店图片")
    private String images;

    @Schema(description = "门店介绍")
    private String introduce;

    @Schema(description = "门店公告")
    private String notice;

    @Schema(description = "营业时间")
    private String businessHours;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "门店状态", example = "1")
    private Boolean status;

    @Schema(description = "是否推荐")
    private Boolean recommend;

}
