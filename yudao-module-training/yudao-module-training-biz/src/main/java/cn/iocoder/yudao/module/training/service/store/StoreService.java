package cn.iocoder.yudao.module.training.service.store;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.training.dal.dataobject.store.StoreDO;
import cn.iocoder.yudao.module.training.vo.store.StoreCreateReqVO;
import cn.iocoder.yudao.module.training.vo.store.StoreExportReqVO;
import cn.iocoder.yudao.module.training.vo.store.StorePageReqVO;
import cn.iocoder.yudao.module.training.vo.store.StoreUpdateReqVO;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 门店 Service 接口
 *
 * @author 阿古旺
 */
public interface StoreService {

    /**
     * 创建门店
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createStore(@Valid StoreCreateReqVO createReqVO);

    /**
     * 更新门店
     *
     * @param updateReqVO 更新信息
     */
    void updateStore(@Valid StoreUpdateReqVO updateReqVO);

    /**
     * 删除门店
     *
     * @param id 编号
     */
    void deleteStore(Long id);

    /**
     * 获得门店
     *
     * @param id 编号
     * @return 门店
     */
    StoreDO getStore(Long id);

    /**
     * 获得门店列表
     *
     * @param ids 编号
     * @return 门店列表
     */
    List<StoreDO> getStoreList(Collection<Long> ids);

    /**
     * 获得门店分页
     *
     * @param pageReqVO 分页查询
     * @return 门店分页
     */
    PageResult<StoreDO> getStorePage(StorePageReqVO pageReqVO);

    /**
     * 获得门店列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 门店列表
     */
    List<StoreDO> getStoreList(StoreExportReqVO exportReqVO);

    Map<Long, StoreDO> getStoreMap(List<Long> storeIds);
}
