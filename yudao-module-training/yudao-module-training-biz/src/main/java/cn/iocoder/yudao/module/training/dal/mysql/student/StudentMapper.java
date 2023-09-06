package cn.iocoder.yudao.module.training.dal.mysql.student;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.training.dal.dataobject.student.StudentDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.training.controller.admin.student.vo.*;

/**
 * 学员 Mapper
 *
 * @author 阿古旺
 */
@Mapper
public interface StudentMapper extends BaseMapperX<StudentDO> {

    default PageResult<StudentDO> selectPage(StudentPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<StudentDO>()
                .eqIfPresent(StudentDO::getStoreId, reqVO.getStoreId())
                .eqIfPresent(StudentDO::getCoachId, reqVO.getCoachId())
                .eqIfPresent(StudentDO::getMemberId, reqVO.getMemberId())
                .likeIfPresent(StudentDO::getName, reqVO.getName())
                .eqIfPresent(StudentDO::getAvatar, reqVO.getAvatar())
                .eqIfPresent(StudentDO::getStatus, reqVO.getStatus())
                .eqIfPresent(StudentDO::getSort, reqVO.getSort())
                .betweenIfPresent(StudentDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(StudentDO::getId));
    }

    default List<StudentDO> selectList(StudentExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<StudentDO>()
                .eqIfPresent(StudentDO::getStoreId, reqVO.getStoreId())
                .eqIfPresent(StudentDO::getCoachId, reqVO.getCoachId())
                .eqIfPresent(StudentDO::getMemberId, reqVO.getMemberId())
                .likeIfPresent(StudentDO::getName, reqVO.getName())
                .eqIfPresent(StudentDO::getAvatar, reqVO.getAvatar())
                .eqIfPresent(StudentDO::getStatus, reqVO.getStatus())
                .eqIfPresent(StudentDO::getSort, reqVO.getSort())
                .betweenIfPresent(StudentDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(StudentDO::getId));
    }

}
