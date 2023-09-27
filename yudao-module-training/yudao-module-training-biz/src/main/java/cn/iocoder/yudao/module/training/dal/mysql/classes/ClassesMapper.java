package cn.iocoder.yudao.module.training.dal.mysql.classes;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.training.dal.dataobject.classes.ClassesDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.training.controller.admin.classes.vo.*;

/**
 * 班级信息 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface ClassesMapper extends BaseMapperX<ClassesDO> {

    default PageResult<ClassesDO> selectPage(ClassesPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<ClassesDO>()
                .likeIfPresent(ClassesDO::getName, reqVO.getName())
                .eqIfPresent(ClassesDO::getStoreId, reqVO.getStoreId())
                .eqIfPresent(ClassesDO::getCoachId, reqVO.getCoachId())
                .betweenIfPresent(ClassesDO::getStartDate, reqVO.getStartDate())
                .betweenIfPresent(ClassesDO::getEndDate, reqVO.getEndDate())
                .eqIfPresent(ClassesDO::getDay, reqVO.getDay())
                .betweenIfPresent(ClassesDO::getStartTime, reqVO.getStartTime())
                .betweenIfPresent(ClassesDO::getEndTime, reqVO.getEndTime())
                .eqIfPresent(ClassesDO::getAvatar, reqVO.getAvatar())
                .eqIfPresent(ClassesDO::getType, reqVO.getType())
                .eqIfPresent(ClassesDO::getExtend, reqVO.getExtend())
                .eqIfPresent(ClassesDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ClassesDO::getRemark, reqVO.getRemark())
                .betweenIfPresent(ClassesDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(ClassesDO::getId));
    }

    default List<ClassesDO> selectList(ClassesExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<ClassesDO>()
                .likeIfPresent(ClassesDO::getName, reqVO.getName())
                .eqIfPresent(ClassesDO::getStoreId, reqVO.getStoreId())
                .eqIfPresent(ClassesDO::getCoachId, reqVO.getCoachId())
                .betweenIfPresent(ClassesDO::getStartDate, reqVO.getStartDate())
                .betweenIfPresent(ClassesDO::getEndDate, reqVO.getEndDate())
                .eqIfPresent(ClassesDO::getDay, reqVO.getDay())
                .betweenIfPresent(ClassesDO::getStartTime, reqVO.getStartTime())
                .betweenIfPresent(ClassesDO::getEndTime, reqVO.getEndTime())
                .eqIfPresent(ClassesDO::getAvatar, reqVO.getAvatar())
                .eqIfPresent(ClassesDO::getType, reqVO.getType())
                .eqIfPresent(ClassesDO::getExtend, reqVO.getExtend())
                .eqIfPresent(ClassesDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ClassesDO::getRemark, reqVO.getRemark())
                .betweenIfPresent(ClassesDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(ClassesDO::getId));
    }

}
