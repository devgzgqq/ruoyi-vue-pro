package cn.iocoder.yudao.module.training.service.store;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import javax.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.training.controller.app.store.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.store.StoreDO;
import cn.iocoder.yudao.module.training.dal.mysql.store.StoreMapper;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import javax.annotation.Resource;
import org.springframework.context.annotation.Import;
import java.util.*;
import java.time.LocalDateTime;

import static cn.hutool.core.util.RandomUtil.*;
import static cn.iocoder.yudao.module.training.enums.ErrorCodeConstants.*;
import static cn.iocoder.yudao.framework.test.core.util.AssertUtils.*;
import static cn.iocoder.yudao.framework.test.core.util.RandomUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.LocalDateTimeUtils.*;
import static cn.iocoder.yudao.framework.common.util.object.ObjectUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.DateUtils.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
 * {@link StoreServiceImpl} 的单元测试类
 *
 * @author 阿古旺
 */
@Import(StoreServiceImpl.class)
public class StoreServiceImplTest extends BaseDbUnitTest {

    @Resource
    private StoreServiceImpl storeService;

    @Resource
    private StoreMapper storeMapper;

    @Test
    public void testCreateStore_success() {
        // 准备参数
        AppStoreCreateReqVO reqVO = randomPojo(AppStoreCreateReqVO.class);

        // 调用
        Long storeId = storeService.createStore(reqVO);
        // 断言
        assertNotNull(storeId);
        // 校验记录的属性是否正确
        StoreDO store = storeMapper.selectById(storeId);
        assertPojoEquals(reqVO, store);
    }

    @Test
    public void testUpdateStore_success() {
        // mock 数据
        StoreDO dbStore = randomPojo(StoreDO.class);
        storeMapper.insert(dbStore);// @Sql: 先插入出一条存在的数据
        // 准备参数
        AppStoreUpdateReqVO reqVO = randomPojo(AppStoreUpdateReqVO.class, o -> {
            o.setId(dbStore.getId()); // 设置更新的 ID
        });

        // 调用
        storeService.updateStore(reqVO);
        // 校验是否更新正确
        StoreDO store = storeMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, store);
    }

    @Test
    public void testUpdateStore_notExists() {
        // 准备参数
        AppStoreUpdateReqVO reqVO = randomPojo(AppStoreUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> storeService.updateStore(reqVO), STORE_NOT_EXISTS);
    }

    @Test
    public void testDeleteStore_success() {
        // mock 数据
        StoreDO dbStore = randomPojo(StoreDO.class);
        storeMapper.insert(dbStore);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbStore.getId();

        // 调用
        storeService.deleteStore(id);
       // 校验数据不存在了
       assertNull(storeMapper.selectById(id));
    }

    @Test
    public void testDeleteStore_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> storeService.deleteStore(id), STORE_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetStorePage() {
       // mock 数据
       StoreDO dbStore = randomPojo(StoreDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setMobile(null);
           o.setAddress(null);
           o.setLongitude(null);
           o.setLatitude(null);
           o.setStatus(null);
           o.setRecommend(null);
           o.setCreator(null);
           o.setCreateTime(null);
       });
       storeMapper.insert(dbStore);
       // 测试 name 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setName(null)));
       // 测试 mobile 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setMobile(null)));
       // 测试 address 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setAddress(null)));
       // 测试 longitude 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setLongitude(null)));
       // 测试 latitude 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setLatitude(null)));
       // 测试 status 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setStatus(null)));
       // 测试 recommend 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setRecommend(null)));
       // 测试 creator 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setCreator(null)));
       // 测试 createTime 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setCreateTime(null)));
       // 准备参数
       AppStorePageReqVO reqVO = new AppStorePageReqVO();
       reqVO.setName(null);
       reqVO.setMobile(null);
       reqVO.setAddress(null);
       reqVO.setLongitude(null);
       reqVO.setLatitude(null);
       reqVO.setStatus(null);
       reqVO.setRecommend(null);
       reqVO.setCreator(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));

       // 调用
       PageResult<StoreDO> pageResult = storeService.getStorePage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbStore, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetStoreList() {
       // mock 数据
       StoreDO dbStore = randomPojo(StoreDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setMobile(null);
           o.setAddress(null);
           o.setLongitude(null);
           o.setLatitude(null);
           o.setStatus(null);
           o.setRecommend(null);
           o.setCreator(null);
           o.setCreateTime(null);
       });
       storeMapper.insert(dbStore);
       // 测试 name 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setName(null)));
       // 测试 mobile 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setMobile(null)));
       // 测试 address 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setAddress(null)));
       // 测试 longitude 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setLongitude(null)));
       // 测试 latitude 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setLatitude(null)));
       // 测试 status 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setStatus(null)));
       // 测试 recommend 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setRecommend(null)));
       // 测试 creator 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setCreator(null)));
       // 测试 createTime 不匹配
       storeMapper.insert(cloneIgnoreId(dbStore, o -> o.setCreateTime(null)));
       // 准备参数
       AppStoreExportReqVO reqVO = new AppStoreExportReqVO();
       reqVO.setName(null);
       reqVO.setMobile(null);
       reqVO.setAddress(null);
       reqVO.setLongitude(null);
       reqVO.setLatitude(null);
       reqVO.setStatus(null);
       reqVO.setRecommend(null);
       reqVO.setCreator(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));

       // 调用
       List<StoreDO> list = storeService.getStoreList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbStore, list.get(0));
    }

}
