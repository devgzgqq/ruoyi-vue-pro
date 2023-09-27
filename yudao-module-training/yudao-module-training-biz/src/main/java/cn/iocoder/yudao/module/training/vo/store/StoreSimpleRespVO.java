package cn.iocoder.yudao.module.training.vo.store;

import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

import static cn.iocoder.yudao.framework.common.util.date.DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND;

public class StoreSimpleRespVO {
    @Schema(description = "门店名称", example = "李四")
    private String name;

    @Schema(description = "门店手机号")
    private String mobile;

    @Schema(description = "门店地址")
    private String address;

    @Schema(description = "经度")
    private String longitude;

    @Schema(description = "纬度")
    private String latitude;

    @Schema(description = "门店状态", example = "1")
    private Byte status;

    @Schema(description = "是否推荐")
    private Boolean recommend;

    @Schema(description = "创建者")
    private String creator;

    @Schema(description = "创建时间")
    @DateTimeFormat(pattern = FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND)
    private LocalDateTime[] createTime;
}
