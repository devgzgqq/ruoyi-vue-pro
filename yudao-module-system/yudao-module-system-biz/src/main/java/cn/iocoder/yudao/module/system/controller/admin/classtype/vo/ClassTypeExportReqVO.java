package cn.iocoder.yudao.module.system.controller.admin.classtype.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import cn.iocoder.yudao.framework.common.pojo.PageParam;
import java.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

@Schema(description = "管理后台 - 类型 Excel 导出 Request VO，参数和 ClassTypePageReqVO 是一致的")
@Data
public class ClassTypeExportReqVO {

    @Schema(description = "名称", example = "芋艿")
    private String className;

    @Schema(description = "类型", example = "2")
    private String classType;

    @Schema(description = "分组")
    private String classGroup;

    @Schema(description = "状态", example = "1")
    private Boolean status;

    @Schema(description = "排序")
    private Integer sort;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;

}
