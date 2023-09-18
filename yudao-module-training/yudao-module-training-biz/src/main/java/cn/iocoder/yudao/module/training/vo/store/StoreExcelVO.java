package cn.iocoder.yudao.module.training.vo.store;

import cn.iocoder.yudao.framework.excel.core.annotations.DictFormat;
import cn.iocoder.yudao.framework.excel.core.convert.DictConvert;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.time.LocalDateTime;


/**
 * 门店 Excel VO
 *
 * @author 阿古旺
 */
@Data
public class StoreExcelVO {

    @ExcelProperty("门店编号")
    private Long id;

    @ExcelProperty("门店名称")
    private String name;

    @ExcelProperty("门店手机号")
    private String mobile;

    @ExcelProperty("门店地址")
    private String address;

    @ExcelProperty("经度")
    private String longitude;

    @ExcelProperty("纬度")
    private String latitude;

    @ExcelProperty("门店logo")
    private String logo;

    @ExcelProperty("门店图片")
    private String images;

    @ExcelProperty("门店介绍")
    private String introduce;

    @ExcelProperty("门店公告")
    private String notice;

    @ExcelProperty("营业时间")
    private String businessHours;

    @ExcelProperty("排序")
    private Integer sort;

    @ExcelProperty(value = "门店状态", converter = DictConvert.class)
    @DictFormat("infra_boolean_string") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private Byte status;

    @ExcelProperty(value = "是否推荐", converter = DictConvert.class)
    @DictFormat("infra_boolean_string") // TODO 代码优化：建议设置到对应的 XXXDictTypeConstants 枚举类中
    private Boolean recommend;

    @ExcelProperty("创建者")
    private String creator;

    @ExcelProperty("创建时间")
    private LocalDateTime createTime;

    @ExcelProperty("更新者")
    private String updater;

    @ExcelProperty("更新时间")
    private LocalDateTime updateTime;

    @ExcelProperty("是否删除")
    private Boolean deleted;

    @ExcelProperty("租户编号")
    private Long tenantId;

}
