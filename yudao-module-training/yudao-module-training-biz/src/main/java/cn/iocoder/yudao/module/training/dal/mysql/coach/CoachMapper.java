package cn.iocoder.yudao.module.training.dal.mysql.coach;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.training.dal.dataobject.coach.CoachDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.training.controller.admin.coach.vo.*;

/**
 * 教练 Mapper
 *
 * @author 阿古旺
 */
@Mapper
public interface CoachMapper extends BaseMapperX<CoachDO> {

    default PageResult<CoachDO> selectPage(CoachPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<CoachDO>()
                .likeIfPresent(CoachDO::getName, reqVO.getName())
                .eqIfPresent(CoachDO::getMobile, reqVO.getMobile())
                .eqIfPresent(CoachDO::getLevel, reqVO.getLevel())
                .eqIfPresent(CoachDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(CoachDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(CoachDO::getId));
    }

    default List<CoachDO> selectList(CoachExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<CoachDO>()
                .likeIfPresent(CoachDO::getName, reqVO.getName())
                .eqIfPresent(CoachDO::getMobile, reqVO.getMobile())
                .eqIfPresent(CoachDO::getLevel, reqVO.getLevel())
                .eqIfPresent(CoachDO::getStatus, reqVO.getStatus())
                .betweenIfPresent(CoachDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(CoachDO::getId));
    }

}
