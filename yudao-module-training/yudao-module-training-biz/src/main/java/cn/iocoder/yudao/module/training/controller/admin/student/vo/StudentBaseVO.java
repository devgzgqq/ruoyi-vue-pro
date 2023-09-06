package cn.iocoder.yudao.module.training.controller.admin.student.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import javax.validation.constraints.*;

/**
 * 学员 Base VO，提供给添加、修改、详细的子 VO 使用
 * 如果子 VO 存在差异的字段，请不要添加到这里，影响 Swagger 文档生成
 */
@Data
public class StudentBaseVO {

    @Schema(description = "门店ID", example = "10770")
    private Long storeId;

    @Schema(description = "教练ID", example = "464")
    private Long coachId;

    @Schema(description = "会员ID", example = "9654")
    private Long memberId;

    @Schema(description = "姓名", requiredMode = Schema.RequiredMode.REQUIRED, example = "芋艿")
    @NotNull(message = "姓名不能为空")
    private String name;

    @Schema(description = "头像")
    private String avatar;

    @Schema(description = "状态", example = "2")
    private Boolean status;

    @Schema(description = "排序")
    private Integer sort;

}
