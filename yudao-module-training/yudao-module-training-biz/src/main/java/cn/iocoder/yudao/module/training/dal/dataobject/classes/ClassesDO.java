package cn.iocoder.yudao.module.training.dal.dataobject.classes;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 班级信息 DO
 *
 * @author 芋道源码
 */
@TableName("training_classes")
@KeySequence("training_classes_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ClassesDO extends BaseDO {

    /**
     * 班级ID
     */
    @TableId
    private Long id;
    /**
     * 名称
     */
    private String name;
    /**
     * 门店ID
     */
    private Long storeId;
    /**
     * 教练ID
     */
    private String coachId;
    /**
     * 开始日期
     */
    private LocalDateTime startDate;
    /**
     * 结束日期
     */
    private LocalDateTime endDate;
    /**
     * 周几
     */
    private String day;
    /**
     * 开始时间
     */
    private LocalDateTime startTime;
    /**
     * 结束时间
     */
    private LocalDateTime endTime;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 类型
     */
    private String type;
    /**
     * 扩展属性
     */
    private String extend;
    /**
     * 状态
     */
    private Byte status;
    /**
     * 备注
     */
    private String remark;

}
