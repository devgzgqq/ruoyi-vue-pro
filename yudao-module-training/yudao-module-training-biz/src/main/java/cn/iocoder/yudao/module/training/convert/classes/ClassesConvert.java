package cn.iocoder.yudao.module.training.convert.classes;

import java.util.*;

import cn.iocoder.yudao.framework.common.pojo.PageResult;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;
import cn.iocoder.yudao.module.training.controller.admin.classes.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.classes.ClassesDO;

/**
 * 班级信息 Convert
 *
 * @author 芋道源码
 */
@Mapper
public interface ClassesConvert {

    ClassesConvert INSTANCE = Mappers.getMapper(ClassesConvert.class);

    ClassesDO convert(ClassesCreateReqVO bean);

    ClassesDO convert(ClassesUpdateReqVO bean);

    ClassesRespVO convert(ClassesDO bean);

    List<ClassesRespVO> convertList(List<ClassesDO> list);

    PageResult<ClassesRespVO> convertPage(PageResult<ClassesDO> page);

    List<ClassesExcelVO> convertList02(List<ClassesDO> list);

}
