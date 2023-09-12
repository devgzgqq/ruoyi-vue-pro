package cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;
import cn.iocoder.yudao.framework.excel.core.annotations.DictFormat;
import cn.iocoder.yudao.framework.excel.core.convert.DictConvert;


/**
 * 顾问 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class SalespersonExcelVO {

    @ExcelProperty("顾问编号")
    private Long id;

    @ExcelProperty("顾问名称")
    private String name;

    @ExcelProperty("顾问手机号")
    private String mobile;

    @ExcelProperty("顾问头像")
    private String avatar;

    @ExcelProperty(value = "顾问级别", converter = DictConvert.class)
    @DictFormat("operation_salesperson_level") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private String level;

    @ExcelProperty("顾问图片")
    private String images;

    @ExcelProperty("顾问介绍")
    private String introduce;

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

    @ExcelProperty("用户编号")
    private Long userId;

    @ExcelProperty("顾问昵称")
    private String nickname;

}
