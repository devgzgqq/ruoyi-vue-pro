package cn.iocoder.yudao.module.operation.service.salesperson;

import java.util.*;
import javax.validation.*;
import cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo.*;
import cn.iocoder.yudao.module.operation.dal.dataobject.salesperson.SalespersonDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

/**
 * 顾问 Service 接口
 *
 * @author 芋道源码
 */
public interface SalespersonService {

    /**
     * 创建顾问
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createSalesperson(@Valid SalespersonCreateReqVO createReqVO);

    /**
     * 更新顾问
     *
     * @param updateReqVO 更新信息
     */
    void updateSalesperson(@Valid SalespersonUpdateReqVO updateReqVO);

    /**
     * 删除顾问
     *
     * @param id 编号
     */
    void deleteSalesperson(Long id);

    /**
     * 获得顾问
     *
     * @param id 编号
     * @return 顾问
     */
    SalespersonDO getSalesperson(Long id);

    /**
     * 获得顾问列表
     *
     * @param ids 编号
     * @return 顾问列表
     */
    List<SalespersonDO> getSalespersonList(Collection<Long> ids);

    /**
     * 获得顾问分页
     *
     * @param pageReqVO 分页查询
     * @return 顾问分页
     */
    PageResult<SalespersonDO> getSalespersonPage(SalespersonPageReqVO pageReqVO);

    /**
     * 获得顾问列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 顾问列表
     */
    List<SalespersonDO> getSalespersonList(SalespersonExportReqVO exportReqVO);

}
