package cn.iocoder.yudao.module.operation.dal.dataobject.salesperson;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 顾问 DO
 *
 * @author 芋道源码
 */
@TableName("operation_salesperson")
@KeySequence("operation_salesperson_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SalespersonDO extends BaseDO {

    /**
     * 顾问编号
     */
    @TableId
    private Long id;
    /**
     * 顾问名称
     */
    private String name;
    /**
     * 顾问手机号
     */
    private String mobile;
    /**
     * 顾问头像
     */
    private String avatar;
    /**
     * 顾问级别
     *
     * 枚举 {@link TODO operation_salesperson_level 对应的类}
     */
    private String level;
    /**
     * 顾问图片
     */
    private String images;
    /**
     * 顾问介绍
     */
    private String introduce;
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
    /**
     * 用户编号
     */
    private Long userId;
    /**
     * 顾问昵称
     */
    private String nickname;

}
