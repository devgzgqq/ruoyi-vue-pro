package cn.iocoder.yudao.module.system.dal.dataobject.classtype;

import lombok.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.*;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;

/**
 * 类型 DO
 *
 * @author 芋道源码
 */
@TableName("system_class_type")
@KeySequence("system_class_type_seq") // 用于 Oracle、PostgreSQL、Kingbase、DB2、H2 数据库的主键自增。如果是 MySQL 等数据库，可不写。
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ClassTypeDO extends BaseDO {

    /**
     * 编号
     */
    @TableId
    private Long id;
    /**
     * 名称
     */
    private String className;
    /**
     * 类型
     */
    private String classType;
    /**
     * 分组
     *
     * 枚举 {@link TODO system_class_group 对应的类}
     */
    private String classGroup;
    /**
     * 结构
     */
    private String classStructure;
    /**
     * 状态
     *
     * 枚举 {@link TODO infra_boolean_string 对应的类}
     */
    private Boolean status;
    /**
     * 排序
     */
    private Integer sort;

}
