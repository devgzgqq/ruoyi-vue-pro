package cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDateTime;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 顾问分页 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class SalespersonPageReqVO extends PageParam {

    @Schema(description = "顾问名称", example = "张三")
    private String name;

    @Schema(description = "顾问手机号")
    private String mobile;

    @Schema(description = "顾问级别")
    private String level;

    @Schema(description = "状态", example = "2")
    private Boolean status;

    @Schema(description = "推荐")
    private Boolean recommend;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

    @Schema(description = "用户编号", example = "832")
    private Long userId;

    @Schema(description = "顾问昵称", example = "芋艿")
    private String nickname;

}
