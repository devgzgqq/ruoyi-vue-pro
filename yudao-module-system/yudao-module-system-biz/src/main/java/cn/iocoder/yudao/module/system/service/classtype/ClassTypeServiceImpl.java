package cn.iocoder.yudao.module.system.service.classtype;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.system.controller.admin.classtype.vo.*;
import cn.iocoder.yudao.module.system.dal.dataobject.classtype.ClassTypeDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.system.convert.classtype.ClassTypeConvert;
import cn.iocoder.yudao.module.system.dal.mysql.classtype.ClassTypeMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.system.enums.ErrorCodeConstants.*;

/**
 * 类型 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class ClassTypeServiceImpl implements ClassTypeService {

    @Resource
    private ClassTypeMapper classTypeMapper;

    @Override
    public Long createClassType(ClassTypeCreateReqVO createReqVO) {
        // 插入
        ClassTypeDO classType = ClassTypeConvert.INSTANCE.convert(createReqVO);
        classTypeMapper.insert(classType);
        // 返回
        return classType.getId();
    }

    @Override
    public void updateClassType(ClassTypeUpdateReqVO updateReqVO) {
        // 校验存在
        validateClassTypeExists(updateReqVO.getId());
        // 更新
        ClassTypeDO updateObj = ClassTypeConvert.INSTANCE.convert(updateReqVO);
        classTypeMapper.updateById(updateObj);
    }

    @Override
    public void deleteClassType(Long id) {
        // 校验存在
        validateClassTypeExists(id);
        // 删除
        classTypeMapper.deleteById(id);
    }

    private void validateClassTypeExists(Long id) {
        if (classTypeMapper.selectById(id) == null) {
            throw exception(CLASS_TYPE_NOT_EXISTS);
        }
    }

    @Override
    public ClassTypeDO getClassType(Long id) {
        return classTypeMapper.selectById(id);
    }

    @Override
    public List<ClassTypeDO> getClassTypeList(Collection<Long> ids) {
        return classTypeMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<ClassTypeDO> getClassTypePage(ClassTypePageReqVO pageReqVO) {
        return classTypeMapper.selectPage(pageReqVO);
    }

    @Override
    public List<ClassTypeDO> getClassTypeList(ClassTypeExportReqVO exportReqVO) {
        return classTypeMapper.selectList(exportReqVO);
    }

}
