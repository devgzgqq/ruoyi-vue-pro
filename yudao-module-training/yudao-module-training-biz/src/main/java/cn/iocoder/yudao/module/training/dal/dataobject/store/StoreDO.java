package cn.iocoder.yudao.module.training.dal.dataobject.store;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sun.xml.bind.v2.TODO;
import lombok.*;

/**
 * 门店 DO
 *
 * @author 阿古旺
 */
@TableName("training_store")
@KeySequence("training_store_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StoreDO extends BaseDO {

    /**
     * 门店编号
     */
    @TableId
    private Long id;
    /**
     * 门店名称
     */
    private String name;
    /**
     * 门店手机号
     */
    private String mobile;
    /**
     * 门店地址
     */
    private String address;
    /**
     * 经度
     */
    private String longitude;
    /**
     * 纬度
     */
    private String latitude;
    /**
     * 门店logo
     */
    private String logo;
    /**
     * 门店图片
     */
    private String images;
    /**
     * 门店介绍
     */
    private String introduce;
    /**
     * 门店公告
     */
    private String notice;
    /**
     * 营业时间
     */
    private String businessHours;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 门店状态
     *
     * 枚举 {@link TODO infra_boolean_string 对应的类}
     */
    private Boolean status;
    /**
     * 是否推荐
     *
     * 枚举 {@link TODO infra_boolean_string 对应的类}
     */
    private Boolean recommend;

}
