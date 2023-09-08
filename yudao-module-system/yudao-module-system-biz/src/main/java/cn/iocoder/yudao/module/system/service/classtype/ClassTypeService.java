package cn.iocoder.yudao.module.system.service.classtype;

import java.util.*;
import javax.validation.*;
import cn.iocoder.yudao.module.system.controller.admin.classtype.vo.*;
import cn.iocoder.yudao.module.system.dal.dataobject.classtype.ClassTypeDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 类型 Service 接口
 *
 * @author 芋道源码
 */
public interface ClassTypeService {

    /**
     * 创建类型
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createClassType(@Valid ClassTypeCreateReqVO createReqVO);

    /**
     * 更新类型
     *
     * @param updateReqVO 更新信息
     */
    void updateClassType(@Valid ClassTypeUpdateReqVO updateReqVO);

    /**
     * 删除类型
     *
     * @param id 编号
     */
    void deleteClassType(Long id);

    /**
     * 获得类型
     *
     * @param id 编号
     * @return 类型
     */
    ClassTypeDO getClassType(Long id);

    /**
     * 获得类型列表
     *
     * @param ids 编号
     * @return 类型列表
     */
    List<ClassTypeDO> getClassTypeList(Collection<Long> ids);

    /**
     * 获得类型分页
     *
     * @param pageReqVO 分页查询
     * @return 类型分页
     */
    PageResult<ClassTypeDO> getClassTypePage(ClassTypePageReqVO pageReqVO);

    /**
     * 获得类型列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 类型列表
     */
    List<ClassTypeDO> getClassTypeList(ClassTypeExportReqVO exportReqVO);

}
