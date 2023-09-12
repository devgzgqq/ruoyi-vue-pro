package cn.iocoder.yudao.module.operation.service.salesperson;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import javax.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo.*;
import cn.iocoder.yudao.module.operation.dal.dataobject.salesperson.SalespersonDO;
import cn.iocoder.yudao.module.operation.dal.mysql.salesperson.SalespersonMapper;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import javax.annotation.Resource;
import org.springframework.context.annotation.Import;
import java.util.*;
import java.time.LocalDateTime;

import static cn.hutool.core.util.RandomUtil.*;
import static cn.iocoder.yudao.module.operation.enums.ErrorCodeConstants.*;
import static cn.iocoder.yudao.framework.test.core.util.AssertUtils.*;
import static cn.iocoder.yudao.framework.test.core.util.RandomUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.LocalDateTimeUtils.*;
import static cn.iocoder.yudao.framework.common.util.object.ObjectUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.DateUtils.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
 * {@link SalespersonServiceImpl} 的单元测试类
 *
 * @author 芋道源码
 */
@Import(SalespersonServiceImpl.class)
public class SalespersonServiceImplTest extends BaseDbUnitTest {

    @Resource
    private SalespersonServiceImpl salespersonService;

    @Resource
    private SalespersonMapper salespersonMapper;

    @Test
    public void testCreateSalesperson_success() {
        // 准备参数
        SalespersonCreateReqVO reqVO = randomPojo(SalespersonCreateReqVO.class);

        // 调用
        Long salespersonId = salespersonService.createSalesperson(reqVO);
        // 断言
        assertNotNull(salespersonId);
        // 校验记录的属性是否正确
        SalespersonDO salesperson = salespersonMapper.selectById(salespersonId);
        assertPojoEquals(reqVO, salesperson);
    }

    @Test
    public void testUpdateSalesperson_success() {
        // mock 数据
        SalespersonDO dbSalesperson = randomPojo(SalespersonDO.class);
        salespersonMapper.insert(dbSalesperson);// @Sql: 先插入出一条存在的数据
        // 准备参数
        SalespersonUpdateReqVO reqVO = randomPojo(SalespersonUpdateReqVO.class, o -> {
            o.setId(dbSalesperson.getId()); // 设置更新的 ID
        });

        // 调用
        salespersonService.updateSalesperson(reqVO);
        // 校验是否更新正确
        SalespersonDO salesperson = salespersonMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, salesperson);
    }

    @Test
    public void testUpdateSalesperson_notExists() {
        // 准备参数
        SalespersonUpdateReqVO reqVO = randomPojo(SalespersonUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> salespersonService.updateSalesperson(reqVO), SALESPERSON_NOT_EXISTS);
    }

    @Test
    public void testDeleteSalesperson_success() {
        // mock 数据
        SalespersonDO dbSalesperson = randomPojo(SalespersonDO.class);
        salespersonMapper.insert(dbSalesperson);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbSalesperson.getId();

        // 调用
        salespersonService.deleteSalesperson(id);
       // 校验数据不存在了
       assertNull(salespersonMapper.selectById(id));
    }

    @Test
    public void testDeleteSalesperson_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> salespersonService.deleteSalesperson(id), SALESPERSON_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetSalespersonPage() {
       // mock 数据
       SalespersonDO dbSalesperson = randomPojo(SalespersonDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setMobile(null);
           o.setLevel(null);
           o.setStatus(null);
           o.setRecommend(null);
           o.setSort(null);
           o.setCreateTime(null);
           o.setUserId(null);
           o.setNickname(null);
       });
       salespersonMapper.insert(dbSalesperson);
       // 测试 name 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setName(null)));
       // 测试 mobile 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setMobile(null)));
       // 测试 level 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setLevel(null)));
       // 测试 status 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setStatus(null)));
       // 测试 recommend 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setRecommend(null)));
       // 测试 sort 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setSort(null)));
       // 测试 createTime 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setCreateTime(null)));
       // 测试 userId 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setUserId(null)));
       // 测试 nickname 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setNickname(null)));
       // 准备参数
       SalespersonPageReqVO reqVO = new SalespersonPageReqVO();
       reqVO.setName(null);
       reqVO.setMobile(null);
       reqVO.setLevel(null);
       reqVO.setStatus(null);
       reqVO.setRecommend(null);
       reqVO.setSort(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setUserId(null);
       reqVO.setNickname(null);

       // 调用
       PageResult<SalespersonDO> pageResult = salespersonService.getSalespersonPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbSalesperson, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetSalespersonList() {
       // mock 数据
       SalespersonDO dbSalesperson = randomPojo(SalespersonDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setMobile(null);
           o.setLevel(null);
           o.setStatus(null);
           o.setRecommend(null);
           o.setSort(null);
           o.setCreateTime(null);
           o.setUserId(null);
           o.setNickname(null);
       });
       salespersonMapper.insert(dbSalesperson);
       // 测试 name 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setName(null)));
       // 测试 mobile 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setMobile(null)));
       // 测试 level 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setLevel(null)));
       // 测试 status 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setStatus(null)));
       // 测试 recommend 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setRecommend(null)));
       // 测试 sort 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setSort(null)));
       // 测试 createTime 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setCreateTime(null)));
       // 测试 userId 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setUserId(null)));
       // 测试 nickname 不匹配
       salespersonMapper.insert(cloneIgnoreId(dbSalesperson, o -> o.setNickname(null)));
       // 准备参数
       SalespersonExportReqVO reqVO = new SalespersonExportReqVO();
       reqVO.setName(null);
       reqVO.setMobile(null);
       reqVO.setLevel(null);
       reqVO.setStatus(null);
       reqVO.setRecommend(null);
       reqVO.setSort(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setUserId(null);
       reqVO.setNickname(null);

       // 调用
       List<SalespersonDO> list = salespersonService.getSalespersonList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbSalesperson, list.get(0));
    }

}
