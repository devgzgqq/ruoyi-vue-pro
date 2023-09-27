package cn.iocoder.yudao.module.training.service.classes;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import javax.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.training.controller.admin.classes.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.classes.ClassesDO;
import cn.iocoder.yudao.module.training.dal.mysql.classes.ClassesMapper;
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
 * {@link ClassesServiceImpl} 的单元测试类
 *
 * @author 芋道源码
 */
@Import(ClassesServiceImpl.class)
public class ClassesServiceImplTest extends BaseDbUnitTest {

    @Resource
    private ClassesServiceImpl classesService;

    @Resource
    private ClassesMapper classesMapper;

    @Test
    public void testCreateClasses_success() {
        // 准备参数
        ClassesCreateReqVO reqVO = randomPojo(ClassesCreateReqVO.class);

        // 调用
        Long classesId = classesService.createClasses(reqVO);
        // 断言
        assertNotNull(classesId);
        // 校验记录的属性是否正确
        ClassesDO classes = classesMapper.selectById(classesId);
        assertPojoEquals(reqVO, classes);
    }

    @Test
    public void testUpdateClasses_success() {
        // mock 数据
        ClassesDO dbClasses = randomPojo(ClassesDO.class);
        classesMapper.insert(dbClasses);// @Sql: 先插入出一条存在的数据
        // 准备参数
        ClassesUpdateReqVO reqVO = randomPojo(ClassesUpdateReqVO.class, o -> {
            o.setId(dbClasses.getId()); // 设置更新的 ID
        });

        // 调用
        classesService.updateClasses(reqVO);
        // 校验是否更新正确
        ClassesDO classes = classesMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, classes);
    }

    @Test
    public void testUpdateClasses_notExists() {
        // 准备参数
        ClassesUpdateReqVO reqVO = randomPojo(ClassesUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> classesService.updateClasses(reqVO), CLASSES_NOT_EXISTS);
    }

    @Test
    public void testDeleteClasses_success() {
        // mock 数据
        ClassesDO dbClasses = randomPojo(ClassesDO.class);
        classesMapper.insert(dbClasses);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbClasses.getId();

        // 调用
        classesService.deleteClasses(id);
       // 校验数据不存在了
       assertNull(classesMapper.selectById(id));
    }

    @Test
    public void testDeleteClasses_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> classesService.deleteClasses(id), CLASSES_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetClassesPage() {
       // mock 数据
       ClassesDO dbClasses = randomPojo(ClassesDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setStoreId(null);
           o.setCoachId(null);
           o.setStartDate(null);
           o.setEndDate(null);
           o.setDay(null);
           o.setStartTime(null);
           o.setEndTime(null);
           o.setAvatar(null);
           o.setType(null);
           o.setExtend(null);
           o.setStatus(null);
           o.setRemark(null);
           o.setCreateTime(null);
       });
       classesMapper.insert(dbClasses);
       // 测试 name 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setName(null)));
       // 测试 storeId 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setStoreId(null)));
       // 测试 coachId 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setCoachId(null)));
       // 测试 startDate 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setStartDate(null)));
       // 测试 endDate 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setEndDate(null)));
       // 测试 day 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setDay(null)));
       // 测试 startTime 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setStartTime(null)));
       // 测试 endTime 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setEndTime(null)));
       // 测试 avatar 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setAvatar(null)));
       // 测试 type 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setType(null)));
       // 测试 extend 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setExtend(null)));
       // 测试 status 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setStatus(null)));
       // 测试 remark 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setRemark(null)));
       // 测试 createTime 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setCreateTime(null)));
       // 准备参数
       ClassesPageReqVO reqVO = new ClassesPageReqVO();
       reqVO.setName(null);
       reqVO.setStoreId(null);
       reqVO.setCoachId(null);
       reqVO.setStartDate(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setEndDate(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setDay(null);
       reqVO.setStartTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setEndTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setAvatar(null);
       reqVO.setType(null);
       reqVO.setExtend(null);
       reqVO.setStatus(null);
       reqVO.setRemark(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));

       // 调用
       PageResult<ClassesDO> pageResult = classesService.getClassesPage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbClasses, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetClassesList() {
       // mock 数据
       ClassesDO dbClasses = randomPojo(ClassesDO.class, o -> { // 等会查询到
           o.setName(null);
           o.setStoreId(null);
           o.setCoachId(null);
           o.setStartDate(null);
           o.setEndDate(null);
           o.setDay(null);
           o.setStartTime(null);
           o.setEndTime(null);
           o.setAvatar(null);
           o.setType(null);
           o.setExtend(null);
           o.setStatus(null);
           o.setRemark(null);
           o.setCreateTime(null);
       });
       classesMapper.insert(dbClasses);
       // 测试 name 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setName(null)));
       // 测试 storeId 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setStoreId(null)));
       // 测试 coachId 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setCoachId(null)));
       // 测试 startDate 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setStartDate(null)));
       // 测试 endDate 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setEndDate(null)));
       // 测试 day 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setDay(null)));
       // 测试 startTime 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setStartTime(null)));
       // 测试 endTime 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setEndTime(null)));
       // 测试 avatar 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setAvatar(null)));
       // 测试 type 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setType(null)));
       // 测试 extend 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setExtend(null)));
       // 测试 status 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setStatus(null)));
       // 测试 remark 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setRemark(null)));
       // 测试 createTime 不匹配
       classesMapper.insert(cloneIgnoreId(dbClasses, o -> o.setCreateTime(null)));
       // 准备参数
       ClassesExportReqVO reqVO = new ClassesExportReqVO();
       reqVO.setName(null);
       reqVO.setStoreId(null);
       reqVO.setCoachId(null);
       reqVO.setStartDate(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setEndDate(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setDay(null);
       reqVO.setStartTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setEndTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));
       reqVO.setAvatar(null);
       reqVO.setType(null);
       reqVO.setExtend(null);
       reqVO.setStatus(null);
       reqVO.setRemark(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));

       // 调用
       List<ClassesDO> list = classesService.getClassesList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbClasses, list.get(0));
    }

}
