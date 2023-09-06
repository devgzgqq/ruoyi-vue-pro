package cn.iocoder.yudao.module.training.service.student;

import java.util.*;
import javax.validation.*;
import cn.iocoder.yudao.module.training.controller.admin.student.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.student.StudentDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 学员 Service 接口
 *
 * @author 阿古旺
 */
public interface StudentService {

    /**
     * 创建学员
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createStudent(@Valid StudentCreateReqVO createReqVO);

    /**
     * 更新学员
     *
     * @param updateReqVO 更新信息
     */
    void updateStudent(@Valid StudentUpdateReqVO updateReqVO);

    /**
     * 删除学员
     *
     * @param id 编号
     */
    void deleteStudent(Long id);

    /**
     * 获得学员
     *
     * @param id 编号
     * @return 学员
     */
    StudentDO getStudent(Long id);

    /**
     * 获得学员列表
     *
     * @param ids 编号
     * @return 学员列表
     */
    List<StudentDO> getStudentList(Collection<Long> ids);

    /**
     * 获得学员分页
     *
     * @param pageReqVO 分页查询
     * @return 学员分页
     */
    PageResult<StudentDO> getStudentPage(StudentPageReqVO pageReqVO);

    /**
     * 获得学员列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 学员列表
     */
    List<StudentDO> getStudentList(StudentExportReqVO exportReqVO);

}
