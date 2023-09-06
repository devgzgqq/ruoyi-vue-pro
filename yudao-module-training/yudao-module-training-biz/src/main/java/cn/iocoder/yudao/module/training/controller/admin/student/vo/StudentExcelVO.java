package cn.iocoder.yudao.module.training.controller.admin.student.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;
import cn.iocoder.yudao.framework.excel.core.annotations.DictFormat;
import cn.iocoder.yudao.framework.excel.core.convert.DictConvert;


/**
 * 学员 Excel VO
 *
 * @author 阿古旺
 */
@Data
public class StudentExcelVO {

    @ExcelProperty("编号")
    private Long id;

    @ExcelProperty("门店ID")
    private Long storeId;

    @ExcelProperty("教练ID")
    private Long coachId;

    @ExcelProperty("会员ID")
    private Long memberId;

    @ExcelProperty("姓名")
    private String name;

    @ExcelProperty("头像")
    private String avatar;

    @ExcelProperty(value = "状态", converter = DictConvert.class)
    @DictFormat("infra_boolean_string") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private Boolean status;

    @ExcelProperty("排序")
    private Integer sort;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
