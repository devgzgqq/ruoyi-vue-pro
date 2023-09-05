package cn.iocoder.yudao.module.training.convert.store;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.training.vo.store.*;
import cn.iocoder.yudao.module.training.dal.dataobject.store.StoreDO;

/**
 * 门店 Convert
 *
 * @author 阿古旺
 */
@Mapper
public interface StoreConvert {

    StoreConvert INSTANCE = Mappers.getMapper(StoreConvert.class);

    StoreDO convert(StoreCreateReqVO bean);

    StoreDO convert(StoreUpdateReqVO bean);

    StoreRespVO convert(StoreDO bean);

    List<StoreRespVO> convertList(List<StoreDO> list);

    PageResult<StoreRespVO> convertPage(PageResult<StoreDO> page);

    List<StoreExcelVO> convertList02(List<StoreDO> list);

}
