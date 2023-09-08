package cn.iocoder.yudao.module.system.convert.classtype;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.system.controller.admin.classtype.vo.*;
import cn.iocoder.yudao.module.system.dal.dataobject.classtype.ClassTypeDO;

/**
 * 类型 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface ClassTypeConvert {

    ClassTypeConvert INSTANCE = Mappers.getMapper(ClassTypeConvert.class);

    ClassTypeDO convert(ClassTypeCreateReqVO bean);

    ClassTypeDO convert(ClassTypeUpdateReqVO bean);

    ClassTypeRespVO convert(ClassTypeDO bean);

    List<ClassTypeRespVO> convertList(List<ClassTypeDO> list);

    PageResult<ClassTypeRespVO> convertPage(PageResult<ClassTypeDO> page);

    List<ClassTypeExcelVO> convertList02(List<ClassTypeDO> list);

}
