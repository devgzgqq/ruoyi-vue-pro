package cn.iocoder.yudao.module.training.service.student;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.training.controller.admin.student.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.student.StudentDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.training.convert.student.StudentConvert;
import cn.iocoder.yudao.module.training.dal.mysql.student.StudentMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.training.enums.ErrorCodeConstants.*;

/**
 * 学员 Service 实现类
 *
 * @author 阿古旺
 */
@Service
@Validated
public class StudentServiceImpl implements StudentService {

    @Resource
    private StudentMapper studentMapper;

    @Override
    public Long createStudent(StudentCreateReqVO createReqVO) {
        // 插入
        StudentDO student = StudentConvert.INSTANCE.convert(createReqVO);
        studentMapper.insert(student);
        // 返回
        return student.getId();
    }

    @Override
    public void updateStudent(StudentUpdateReqVO updateReqVO) {
        // 校验存在
        validateStudentExists(updateReqVO.getId());
        // 更新
        StudentDO updateObj = StudentConvert.INSTANCE.convert(updateReqVO);
        studentMapper.updateById(updateObj);
    }

    @Override
    public void deleteStudent(Long id) {
        // 校验存在
        validateStudentExists(id);
        // 删除
        studentMapper.deleteById(id);
    }

    private void validateStudentExists(Long id) {
        if (studentMapper.selectById(id) == null) {
            throw exception(STUDENT_NOT_EXISTS);
        }
    }

    @Override
    public StudentDO getStudent(Long id) {
        return studentMapper.selectById(id);
    }

    @Override
    public List<StudentDO> getStudentList(Collection<Long> ids) {
        return studentMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<StudentDO> getStudentPage(StudentPageReqVO pageReqVO) {
        return studentMapper.selectPage(pageReqVO);
    }

    @Override
    public List<StudentDO> getStudentList(StudentExportReqVO exportReqVO) {
        return studentMapper.selectList(exportReqVO);
    }

}
