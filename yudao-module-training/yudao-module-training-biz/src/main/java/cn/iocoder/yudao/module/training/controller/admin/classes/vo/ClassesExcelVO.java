package cn.iocoder.yudao.module.training.controller.admin.classes.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.LocalDateTime;

import com.alibaba.excel.annotation.ExcelProperty;

/**
 * 班级信息 Excel VO
 *
 * @author 芋道源码
 */
@Data
public class ClassesExcelVO {

    @ExcelProperty("班级ID")
    private Long id;

    @ExcelProperty("名称")
    private String name;

    @ExcelProperty("门店ID")
    private Long storeId;

    @ExcelProperty("教练ID")
    private String coachId;

    @ExcelProperty("开始日期")
    private LocalDateTime startDate;

    @ExcelProperty("结束日期")
    private LocalDateTime endDate;

    @ExcelProperty("周几")
    private String day;

    @ExcelProperty("开始时间")
    private LocalDateTime startTime;

    @ExcelProperty("结束时间")
    private LocalDateTime endTime;

    @ExcelProperty("头像")
    private String avatar;

    @ExcelProperty("类型")
    private String type;

    @ExcelProperty("扩展属性")
    private String extend;

    @ExcelProperty("状态")
    private Byte status;

    @ExcelProperty("备注")
    private String remark;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

}
