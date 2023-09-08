package cn.iocoder.yudao.module.system.controller.admin.classtype.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;
import cn.iocoder.yudao.framework.excel.core.annotations.DictFormat;
import cn.iocoder.yudao.framework.excel.core.convert.DictConvert;


/**
 * 类型 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class ClassTypeExcelVO {

    @ExcelProperty("编号")
    private Long id;

    @ExcelProperty("名称")
    private String className;

    @ExcelProperty("类型")
    private String classType;

    @ExcelProperty(value = "分组", converter = DictConvert.class)
    @DictFormat("system_class_group") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private String classGroup;

    @ExcelProperty("结构")
    private String classStructure;

    @ExcelProperty(value = "状态", converter = DictConvert.class)
    @DictFormat("infra_boolean_string") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private Boolean status;

    @ExcelProperty("排序")
    private Integer sort;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
