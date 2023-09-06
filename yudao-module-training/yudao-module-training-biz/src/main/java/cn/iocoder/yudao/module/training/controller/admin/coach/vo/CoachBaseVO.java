package cn.iocoder.yudao.module.training.controller.admin.coach.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import javax.validation.constraints.*;

/**
 * 教练 Base VO，提供给添加、修改、详细的子 VO 使用
 * 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
 */
@Data
public class CoachBaseVO {

    @Schema(description = "教练名称", requiredMode = Schema.RequiredMode.REQUIRED, example = "王五")
    @NotNull(message = "教练名称不能为空")
    private String name;

    @Schema(description = "教练手机号")
    private String mobile;

    @Schema(description = "教练头像")
    private String avatar;

    @Schema(description = "教练级别")
    private String level;

    @Schema(description = "教练图片")
    private String images;

    @Schema(description = "教练标签")
    private String label;

    @Schema(description = "教练介绍")
    private String introduce;

    @Schema(description = "授课单价", example = "29797")
    private BigDecimal price;

    @Schema(description = "状态", example = "2")
    private Boolean status;

    @Schema(description = "推荐")
    private Boolean recommend;

    @Schema(description = "排序")
    private Integer sort;

}
