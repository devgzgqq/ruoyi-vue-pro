package cn.iocoder.yudao.module.operation.dal.mysql.salesperson;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.operation.dal.dataobject.salesperson.SalespersonDO;
import org.apache.ibatis.annotations.Mapper;
import cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo.*;

/**
 * 顾问 Mapper
 *
 * @author 芋道源码
 */
@Mapper
public interface SalespersonMapper extends BaseMapperX<SalespersonDO> {

    default PageResult<SalespersonDO> selectPage(SalespersonPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<SalespersonDO>()
                .likeIfPresent(SalespersonDO::getName, reqVO.getName())
                .eqIfPresent(SalespersonDO::getMobile, reqVO.getMobile())
                .eqIfPresent(SalespersonDO::getLevel, reqVO.getLevel())
                .eqIfPresent(SalespersonDO::getStatus, reqVO.getStatus())
                .eqIfPresent(SalespersonDO::getRecommend, reqVO.getRecommend())
                .eqIfPresent(SalespersonDO::getSort, reqVO.getSort())
                .betweenIfPresent(SalespersonDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(SalespersonDO::getUserId, reqVO.getUserId())
                .likeIfPresent(SalespersonDO::getNickname, reqVO.getNickname())
                .orderByDesc(SalespersonDO::getId));
    }

    default List<SalespersonDO> selectList(SalespersonExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<SalespersonDO>()
                .likeIfPresent(SalespersonDO::getName, reqVO.getName())
                .eqIfPresent(SalespersonDO::getMobile, reqVO.getMobile())
                .eqIfPresent(SalespersonDO::getLevel, reqVO.getLevel())
                .eqIfPresent(SalespersonDO::getStatus, reqVO.getStatus())
                .eqIfPresent(SalespersonDO::getRecommend, reqVO.getRecommend())
                .eqIfPresent(SalespersonDO::getSort, reqVO.getSort())
                .betweenIfPresent(SalespersonDO::getCreateTime, reqVO.getCreateTime())
                .eqIfPresent(SalespersonDO::getUserId, reqVO.getUserId())
                .likeIfPresent(SalespersonDO::getNickname, reqVO.getNickname())
                .orderByDesc(SalespersonDO::getId));
    }

}
