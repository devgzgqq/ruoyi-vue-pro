package cn.iocoder.yudao.module.training.dal.dataobject.coach;

import lombok.*;
import java.util.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 教练 DO
 *
 * @author 阿古旺
 */
@TableName("training_coach")
@KeySequence("training_coach_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CoachDO extends BaseDO {

    /**
     * 教练编号
     */
    @TableId
    private Long id;
    /**
     * 教练名称
     */
    private String name;
    /**
     * 教练手机号
     */
    private String mobile;
    /**
     * 教练头像
     */
    private String avatar;
    /**
     * 教练级别
     *
     * 枚举 {@link TODO training_coach_level 对应的类}
     */
    private String level;
    /**
     * 教练图片
     */
    private String images;
    /**
     * 教练标签
     *
     * 枚举 {@link TODO training_coach_tags 对应的类}
     */
    private String label;
    /**
     * 教练介绍
     */
    private String introduce;
    /**
     * 授课单价
     */
    private BigDecimal price;
    /**
     * 状态
     *
     * 枚举 {@link TODO infra_boolean_string 对应的类}
     */
    private Boolean status;
    /**
     * 推荐
     *
     * 枚举 {@link TODO infra_boolean_string 对应的类}
     */
    private Boolean recommend;
    /**
     * 排序
     */
    private Integer sort;

}
