package cn.iocoder.yudao.module.operation.convert.salesperson;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo.*;
import cn.iocoder.yudao.module.operation.dal.dataobject.salesperson.SalespersonDO;

/**
 * 顾问 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface SalespersonConvert {

    SalespersonConvert INSTANCE = Mappers.getMapper(SalespersonConvert.class);

    SalespersonDO convert(SalespersonCreateReqVO bean);

    SalespersonDO convert(SalespersonUpdateReqVO bean);

    SalespersonRespVO convert(SalespersonDO bean);

    List<SalespersonRespVO> convertList(List<SalespersonDO> list);

    PageResult<SalespersonRespVO> convertPage(PageResult<SalespersonDO> page);

    List<SalespersonExcelVO> convertList02(List<SalespersonDO> list);

}
