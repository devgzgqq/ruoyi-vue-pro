package cn.iocoder.yudao.module.training.convert.coach;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.training.controller.admin.coach.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.coach.CoachDO;

/**
 * 教练 Convert
 *
 * @author 阿古旺
 */
@Mapper
public interface CoachConvert {

    CoachConvert INSTANCE = Mappers.getMapper(CoachConvert.class);

    CoachDO convert(CoachCreateReqVO bean);

    CoachDO convert(CoachUpdateReqVO bean);

    CoachRespVO convert(CoachDO bean);

    List<CoachRespVO> convertList(List<CoachDO> list);

    PageResult<CoachRespVO> convertPage(PageResult<CoachDO> page);

    List<CoachExcelVO> convertList02(List<CoachDO> list);

}
