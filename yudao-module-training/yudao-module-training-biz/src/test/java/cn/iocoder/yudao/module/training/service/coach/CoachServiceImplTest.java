package cn.iocoder.yudao.module.training.service.coach;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import javax.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.training.controller.admin.coach.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.coach.CoachDO;
import cn.iocoder.yudao.module.training.dal.mysql.coach.CoachMapper;
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
 * {@link CoachServiceImpl} 的单元测试类
 *
 * @author 阿古旺
 */
@Import(CoachServiceImpl.class)
public class CoachServiceImplTest extends BaseDbUnitTest {

    @Resource
    private CoachServiceImpl coachService;

    @Resource
    private CoachMapper coachMapper;

    @Test
    public void testCreateCoach_success() {
        // 准备参数
        CoachCreateReqVO reqVO = randomPojo(CoachCreateReqVO.class);

        // 调用
        Long coachId = coachService.createCoach(reqVO);
        // 断言
        assertNotNull(coachId);
        // 校验记录的属性是否正确
        CoachDO coach = coachMapper.selectById(coachId);
        assertPojoEquals(reqVO, coach);
    }

    @Test
    public void testUpdateCoach_success() {
        // mock 数据
        CoachDO dbCoach = randomPojo(CoachDO.class);
        coachMapper.insert(dbCoach);// @Sql: 先插入出一条存在的数据
        // 准备参数
        CoachUpdateReqVO reqVO = randomPojo(CoachUpdateReqVO.class, o -> {
            o.setId(dbCoach.getId()); // 设置更新的 ID
        });

        // 调用
        coachService.updateCoach(reqVO);
        // 校验是否更新正确
        CoachDO coach = coachMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, coach);
    }

    @Test
    public void testUpdateCoach_notExists() {
        // 准备参数
        CoachUpdateReqVO reqVO = randomPojo(CoachUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> coachService.updateCoach(reqVO), COACH_NOT_EXISTS);
    }

    @Test
    public void testDeleteCoach_success() {
        // mock 数据
        CoachDO dbCoach = randomPojo(CoachDO.class);
        coachMapper.insert(dbCoach);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbCoach.getId();

        // 调用
        coachService.deleteCoach(id);
       // 校验数据不存在了
       assertNull(coachMapper.selectById(id));
    }

    @Test
    public void testDeleteCoach_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> coachService.deleteCoach(id), COACH_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetCoachPage() {
       // mock 数据
       CoachDO dbCoach = randomPojo(CoachDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setMobile(null);
           o.setLevel(null);
           o.setStatus(null);
           o.setCreateTime(null);
       });
       coachMapper.insert(dbCoach);
       // 测试 name 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setName(null)));
       // 测试 mobile 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setMobile(null)));
       // 测试 level 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setLevel(null)));
       // 测试 status 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setStatus(null)));
       // 测试 createTime 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setCreateTime(null)));
       // 准备参数
       CoachPageReqVO reqVO = new CoachPageReqVO();
       reqVO.setName(null);
       reqVO.setMobile(null);
       reqVO.setLevel(null);
       reqVO.setStatus(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));

       // 调用
       PageResult<CoachDO> pageResult = coachService.getCoachPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbCoach, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetCoachList() {
       // mock 数据
       CoachDO dbCoach = randomPojo(CoachDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setMobile(null);
           o.setLevel(null);
           o.setStatus(null);
           o.setCreateTime(null);
       });
       coachMapper.insert(dbCoach);
       // 测试 name 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setName(null)));
       // 测试 mobile 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setMobile(null)));
       // 测试 level 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setLevel(null)));
       // 测试 status 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setStatus(null)));
       // 测试 createTime 不匹配
       coachMapper.insert(cloneIgnoreId(dbCoach, o -> o.setCreateTime(null)));
       // 准备参数
       CoachExportReqVO reqVO = new CoachExportReqVO();
       reqVO.setName(null);
       reqVO.setMobile(null);
       reqVO.setLevel(null);
       reqVO.setStatus(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));

       // 调用
       List<CoachDO> list = coachService.getCoachList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbCoach, list.get(0));
    }

}
