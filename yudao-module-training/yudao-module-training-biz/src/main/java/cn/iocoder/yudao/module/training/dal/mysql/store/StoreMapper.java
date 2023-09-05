package cn.iocoder.yudao.module.training.dal.mysql.store;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.training.dal.dataobject.store.StoreDO;
import cn.iocoder.yudao.module.training.vo.store.StoreExportReqVO;
import cn.iocoder.yudao.module.training.vo.store.StorePageReqVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 门店 Mapper
 *
 * @author 阿古旺
 */
@Mapper
public interface StoreMapper extends BaseMapperX<StoreDO> {

    default PageResult<StoreDO> selectPage(StorePageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<StoreDO>()
                .likeIfPresent(StoreDO::getName, reqVO.getName())
                .eqIfPresent(StoreDO::getMobile, reqVO.getMobile())
                .eqIfPresent(StoreDO::getAddress, reqVO.getAddress())
                .eqIfPresent(StoreDO::getLongitude, reqVO.getLongitude())
                .eqIfPresent(StoreDO::getLatitude, reqVO.getLatitude())
                .eqIfPresent(StoreDO::getStatus, reqVO.getStatus())
                .eqIfPresent(StoreDO::getRecommend, reqVO.getRecommend())
                .eqIfPresent(StoreDO::getCreator, reqVO.getCreator())
                .betweenIfPresent(StoreDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(StoreDO::getId));
    }

    default List<StoreDO> selectList(StoreExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<StoreDO>()
                .likeIfPresent(StoreDO::getName, reqVO.getName())
                .eqIfPresent(StoreDO::getMobile, reqVO.getMobile())
                .eqIfPresent(StoreDO::getAddress, reqVO.getAddress())
                .eqIfPresent(StoreDO::getLongitude, reqVO.getLongitude())
                .eqIfPresent(StoreDO::getLatitude, reqVO.getLatitude())
                .eqIfPresent(StoreDO::getStatus, reqVO.getStatus())
                .eqIfPresent(StoreDO::getRecommend, reqVO.getRecommend())
                .eqIfPresent(StoreDO::getCreator, reqVO.getCreator())
                .betweenIfPresent(StoreDO::getCreateTime, reqVO.getCreateTime())
                .orderByDesc(StoreDO::getId));
    }

}
