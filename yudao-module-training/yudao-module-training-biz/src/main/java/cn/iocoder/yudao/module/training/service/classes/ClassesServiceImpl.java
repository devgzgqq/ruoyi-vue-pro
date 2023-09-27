package cn.iocoder.yudao.module.training.service.classes;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.training.controller.admin.classes.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.classes.ClassesDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.training.convert.classes.ClassesConvert;
import cn.iocoder.yudao.module.training.dal.mysql.classes.ClassesMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.training.enums.ErrorCodeConstants.*;

/**
 * 班级信息 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class ClassesServiceImpl implements ClassesService {

    @Resource
    private ClassesMapper classesMapper;

    @Override
    public Long createClasses(ClassesCreateReqVO createReqVO) {
        // 插入
        ClassesDO classes = ClassesConvert.INSTANCE.convert(createReqVO);
        classesMapper.insert(classes);
        // 返回
        return classes.getId();
    }

    @Override
    public void updateClasses(ClassesUpdateReqVO updateReqVO) {
        // 校验存在
        validateClassesExists(updateReqVO.getId());
        // 更新
        ClassesDO updateObj = ClassesConvert.INSTANCE.convert(updateReqVO);
        classesMapper.updateById(updateObj);
    }

    @Override
    public void deleteClasses(Long id) {
        // 校验存在
        validateClassesExists(id);
        // 删除
        classesMapper.deleteById(id);
    }

    private void validateClassesExists(Long id) {
        if (classesMapper.selectById(id) == null) {
            throw exception(CLASSES_NOT_EXISTS);
        }
    }

    @Override
    public ClassesDO getClasses(Long id) {
        return classesMapper.selectById(id);
    }

    @Override
    public List<ClassesDO> getClassesList(Collection<Long> ids) {
        return classesMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<ClassesDO> getClassesPage(ClassesPageReqVO pageReqVO) {
        return classesMapper.selectPage(pageReqVO);
    }

    @Override
    public List<ClassesDO> getClassesList(ClassesExportReqVO exportReqVO) {
        return classesMapper.selectList(exportReqVO);
    }

}
