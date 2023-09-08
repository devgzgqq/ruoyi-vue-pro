package cn.iocoder.yudao.module.system.dal.mysql.classtype;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.system.dal.dataobject.classtype.ClassTypeDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.system.controller.admin.classtype.vo.*;

/**
 * 类型 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface ClassTypeMapper extends BaseMapperX<ClassTypeDO> {

    default PageResult<ClassTypeDO> selectPage(ClassTypePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<ClassTypeDO>()
                .likeIfPresent(ClassTypeDO::getClassName, reqVO.getClassName())
                .eqIfPresent(ClassTypeDO::getClassType, reqVO.getClassType())
                .eqIfPresent(ClassTypeDO::getClassGroup, reqVO.getClassGroup())
                .eqIfPresent(ClassTypeDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ClassTypeDO::getSort, reqVO.getSort())
                .betweenIfPresent(ClassTypeDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(ClassTypeDO::getId));
    }

    default List<ClassTypeDO> selectList(ClassTypeExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<ClassTypeDO>()
                .likeIfPresent(ClassTypeDO::getClassName, reqVO.getClassName())
                .eqIfPresent(ClassTypeDO::getClassType, reqVO.getClassType())
                .eqIfPresent(ClassTypeDO::getClassGroup, reqVO.getClassGroup())
                .eqIfPresent(ClassTypeDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ClassTypeDO::getSort, reqVO.getSort())
                .betweenIfPresent(ClassTypeDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(ClassTypeDO::getId));
    }

}
