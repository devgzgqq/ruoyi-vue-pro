package cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 顾问 Base VO，提供给添加、修改、详细的子 VO 使用
 * 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
 */
@Data
public class SalespersonBaseVO {

    @Schema(description = "顾问名称", requiredMode = Schema.RequiredMode.REQUIRED, example = "张三")
    @NotNull(message = "顾问名称不能为空")
    private String name;

    @Schema(description = "顾问手机号")
    private String mobile;

    @Schema(description = "顾问头像")
    private String avatar;

    @Schema(description = "顾问级别")
    private String level;

    @Schema(description = "顾问图片")
    private String images;

    @Schema(description = "顾问介绍")
    private String introduce;

    @Schema(description = "状态", requiredMode = Schema.RequiredMode.REQUIRED, example = "2")
    private Boolean status;

    @Schema(description = "推荐", requiredMode = Schema.RequiredMode.REQUIRED)
    private Boolean recommend;

    @Schema(description = "排序", requiredMode = Schema.RequiredMode.REQUIRED)
    private Integer sort;

    @Schema(description = "用户编号", example = "832")
    private Long userId;

    @Schema(description = "顾问昵称", requiredMode = Schema.RequiredMode.REQUIRED, example = "芋艿")
    @NotNull(message = "顾问昵称不能为空")
    private String nickname;

}
