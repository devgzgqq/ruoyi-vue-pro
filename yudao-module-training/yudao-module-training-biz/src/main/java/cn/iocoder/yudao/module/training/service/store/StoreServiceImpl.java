package cn.iocoder.yudao.module.training.service.store;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.training.vo.store.*;
import cn.iocoder.yudao.module.training.dal.dataobject.store.StoreDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.training.convert.store.StoreConvert;
import cn.iocoder.yudao.module.training.dal.mysql.store.StoreMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.training.enums.ErrorCodeConstants.*;

/**
 * 门店 Service 实现类
 *
 * @author 阿古旺
 */
@Service
@Validated
public class StoreServiceImpl implements StoreService {

    @Resource
    private StoreMapper storeMapper;

    @Override
    public Long createStore(StoreCreateReqVO createReqVO) {
        // 插入
        StoreDO store = StoreConvert.INSTANCE.convert(createReqVO);
        storeMapper.insert(store);
        // 返回
        return store.getId();
    }

    @Override
    public void updateStore(StoreUpdateReqVO updateReqVO) {
        // 校验存在
        validateStoreExists(updateReqVO.getId());
        // 更新
        StoreDO updateObj = StoreConvert.INSTANCE.convert(updateReqVO);
        storeMapper.updateById(updateObj);
    }

    @Override
    public void deleteStore(Long id) {
        // 校验存在
        validateStoreExists(id);
        // 删除
        storeMapper.deleteById(id);
    }

    private void validateStoreExists(Long id) {
        if (storeMapper.selectById(id) == null) {
            throw exception(STORE_NOT_EXISTS);
        }
    }

    @Override
    public StoreDO getStore(Long id) {
        return storeMapper.selectById(id);
    }

    @Override
    public List<StoreDO> getStoreList(Collection<Long> ids) {
        return storeMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<StoreDO> getStorePage(StorePageReqVO pageReqVO) {
        return storeMapper.selectPage(pageReqVO);
    }

    @Override
    public List<StoreDO> getStoreList(StoreExportReqVO exportReqVO) {
        return storeMapper.selectList(exportReqVO);
    }

}
