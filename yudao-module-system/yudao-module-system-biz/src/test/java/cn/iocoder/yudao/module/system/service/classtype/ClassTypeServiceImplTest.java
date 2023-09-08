package cn.iocoder.yudao.module.system.service.classtype;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.mock.mockito.MockBean;

import javax.annotation.Resource;

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;

import cn.iocoder.yudao.module.system.controller.admin.classtype.vo.*;
import cn.iocoder.yudao.module.system.dal.dataobject.classtype.ClassTypeDO;
import cn.iocoder.yudao.module.system.dal.mysql.classtype.ClassTypeMapper;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import javax.annotation.Resource;
import org.springframework.context.annotation.Import;
import java.util.*;
import java.time.LocalDateTime;

import static cn.hutool.core.util.RandomUtil.*;
import static cn.iocoder.yudao.module.system.enums.ErrorCodeConstants.*;
import static cn.iocoder.yudao.framework.test.core.util.AssertUtils.*;
import static cn.iocoder.yudao.framework.test.core.util.RandomUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.LocalDateTimeUtils.*;
import static cn.iocoder.yudao.framework.common.util.object.ObjectUtils.*;
import static cn.iocoder.yudao.framework.common.util.date.DateUtils.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
 * {@link ClassTypeServiceImpl} 的单元测试类
 *
 * @author 芋道源码
 */
@Import(ClassTypeServiceImpl.class)
public class ClassTypeServiceImplTest extends BaseDbUnitTest {

    @Resource
    private ClassTypeServiceImpl classTypeService;

    @Resource
    private ClassTypeMapper classTypeMapper;

    @Test
    public void testCreateClassType_success() {
        // 准备参数
        ClassTypeCreateReqVO reqVO = randomPojo(ClassTypeCreateReqVO.class);

        // 调用
        Long classTypeId = classTypeService.createClassType(reqVO);
        // 断言
        assertNotNull(classTypeId);
        // 校验记录的属性是否正确
        ClassTypeDO classType = classTypeMapper.selectById(classTypeId);
        assertPojoEquals(reqVO, classType);
    }

    @Test
    public void testUpdateClassType_success() {
        // mock 数据
        ClassTypeDO dbClassType = randomPojo(ClassTypeDO.class);
        classTypeMapper.insert(dbClassType);// @Sql: 先插入出一条存在的数据
        // 准备参数
        ClassTypeUpdateReqVO reqVO = randomPojo(ClassTypeUpdateReqVO.class, o -> {
            o.setId(dbClassType.getId()); // 设置更新的 ID
        });

        // 调用
        classTypeService.updateClassType(reqVO);
        // 校验是否更新正确
        ClassTypeDO classType = classTypeMapper.selectById(reqVO.getId()); // 获取最新的
        assertPojoEquals(reqVO, classType);
    }

    @Test
    public void testUpdateClassType_notExists() {
        // 准备参数
        ClassTypeUpdateReqVO reqVO = randomPojo(ClassTypeUpdateReqVO.class);

        // 调用, 并断言异常
        assertServiceException(() -> classTypeService.updateClassType(reqVO), CLASS_TYPE_NOT_EXISTS);
    }

    @Test
    public void testDeleteClassType_success() {
        // mock 数据
        ClassTypeDO dbClassType = randomPojo(ClassTypeDO.class);
        classTypeMapper.insert(dbClassType);// @Sql: 先插入出一条存在的数据
        // 准备参数
        Long id = dbClassType.getId();

        // 调用
        classTypeService.deleteClassType(id);
       // 校验数据不存在了
       assertNull(classTypeMapper.selectById(id));
    }

    @Test
    public void testDeleteClassType_notExists() {
        // 准备参数
        Long id = randomLongId();

        // 调用, 并断言异常
        assertServiceException(() -> classTypeService.deleteClassType(id), CLASS_TYPE_NOT_EXISTS);
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetClassTypePage() {
       // mock 数据
       ClassTypeDO dbClassType = randomPojo(ClassTypeDO.class, o -> { // 等会查询到
           o.setClassName(null);
           o.setClassType(null);
           o.setClassGroup(null);
           o.setStatus(null);
           o.setSort(null);
           o.setCreateTime(null);
       });
       classTypeMapper.insert(dbClassType);
       // 测试 className 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setClassName(null)));
       // 测试 classType 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setClassType(null)));
       // 测试 classGroup 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setClassGroup(null)));
       // 测试 status 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setStatus(null)));
       // 测试 sort 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setSort(null)));
       // 测试 createTime 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setCreateTime(null)));
       // 准备参数
       ClassTypePageReqVO reqVO = new ClassTypePageReqVO();
       reqVO.setClassName(null);
       reqVO.setClassType(null);
       reqVO.setClassGroup(null);
       reqVO.setStatus(null);
       reqVO.setSort(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));

       // 调用
       PageResult<ClassTypeDO> pageResult = classTypeService.getClassTypePage(reqVO);
       // 断言
       assertEquals(1, pageResult.getTotal());
       assertEquals(1, pageResult.getList().size());
       assertPojoEquals(dbClassType, pageResult.getList().get(0));
    }

    @Test
    @Disabled  // TODO 请修改 null 为需要的值，然后删除 @Disabled 注解
    public void testGetClassTypeList() {
       // mock 数据
       ClassTypeDO dbClassType = randomPojo(ClassTypeDO.class, o -> { // 等会查询到
           o.setClassName(null);
           o.setClassType(null);
           o.setClassGroup(null);
           o.setStatus(null);
           o.setSort(null);
           o.setCreateTime(null);
       });
       classTypeMapper.insert(dbClassType);
       // 测试 className 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setClassName(null)));
       // 测试 classType 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setClassType(null)));
       // 测试 classGroup 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setClassGroup(null)));
       // 测试 status 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setStatus(null)));
       // 测试 sort 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setSort(null)));
       // 测试 createTime 不匹配
       classTypeMapper.insert(cloneIgnoreId(dbClassType, o -> o.setCreateTime(null)));
       // 准备参数
       ClassTypeExportReqVO reqVO = new ClassTypeExportReqVO();
       reqVO.setClassName(null);
       reqVO.setClassType(null);
       reqVO.setClassGroup(null);
       reqVO.setStatus(null);
       reqVO.setSort(null);
       reqVO.setCreateTime(buildBetweenTime(2023, 2, 1, 2023, 2, 28));

       // 调用
       List<ClassTypeDO> list = classTypeService.getClassTypeList(reqVO);
       // 断言
       assertEquals(1, list.size());
       assertPojoEquals(dbClassType, list.get(0));
    }

}
