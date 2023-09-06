package cn.iocoder.yudao.module.training.controller.admin.coach.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;
import cn.iocoder.yudao.framework.excel.core.annotations.DictFormat;
import cn.iocoder.yudao.framework.excel.core.convert.DictConvert;


/**
 * 教练 Excel VO
 *
 * @author 阿古旺
 */
@Data
public class CoachExcelVO {

    @ExcelProperty("教练编号")
    private Long id;

    @ExcelProperty("教练名称")
    private String name;

    @ExcelProperty("教练手机号")
    private String mobile;

    @ExcelProperty("教练头像")
    private String avatar;

    @ExcelProperty(value = "教练级别", converter = DictConvert.class)
    @DictFormat("training_coach_level") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private String level;

    @ExcelProperty("教练图片")
    private String images;

    @ExcelProperty(value = "教练标签", converter = DictConvert.class)
    @DictFormat("training_coach_tags") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private String label;

    @ExcelProperty("教练介绍")
    private String introduce;

    @ExcelProperty("授课单价")
    private BigDecimal price;

    @ExcelProperty(value = "状态", converter = DictConvert.class)
    @DictFormat("infra_boolean_string") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private Boolean status;

    @ExcelProperty(value = "推荐", converter = DictConvert.class)
    @DictFormat("infra_boolean_string") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private Boolean recommend;

    @ExcelProperty("排序")
    private Integer sort;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
