package cn.iocoder.yudao.module.training.service.classes;

import java.util.*;
import javax.validation.*;
import cn.iocoder.yudao.module.training.controller.admin.classes.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.classes.ClassesDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 班级信息 Service 接口
 *
 * @author 芋道源码
 */
public interface ClassesService {

    /**
     * 创建班级信息
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createClasses(@Valid ClassesCreateReqVO createReqVO);

    /**
     * 更新班级信息
     *
     * @param updateReqVO 更新信息
     */
    void updateClasses(@Valid ClassesUpdateReqVO updateReqVO);

    /**
     * 删除班级信息
     *
     * @param id 编号
     */
    void deleteClasses(Long id);

    /**
     * 获得班级信息
     *
     * @param id 编号
     * @return 班级信息
     */
    ClassesDO getClasses(Long id);

    /**
     * 获得班级信息列表
     *
     * @param ids 编号
     * @return 班级信息列表
     */
    List<ClassesDO> getClassesList(Collection<Long> ids);

    /**
     * 获得班级信息分页
     *
     * @param pageReqVO 分页查询
     * @return 班级信息分页
     */
    PageResult<ClassesDO> getClassesPage(ClassesPageReqVO pageReqVO);

    /**
     * 获得班级信息列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 班级信息列表
     */
    List<ClassesDO> getClassesList(ClassesExportReqVO exportReqVO);

}
