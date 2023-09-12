package cn.iocoder.yudao.module.operation.service.salesperson;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo.*;
import cn.iocoder.yudao.module.operation.dal.dataobject.salesperson.SalespersonDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.operation.convert.salesperson.SalespersonConvert;
import cn.iocoder.yudao.module.operation.dal.mysql.salesperson.SalespersonMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.operation.enums.ErrorCodeConstants.*;

/**
 * 顾问 Service 实现类
 *
 * @author 芋道源码
 */
@Service
@Validated
public class SalespersonServiceImpl implements SalespersonService {

    @Resource
    private SalespersonMapper salespersonMapper;

    @Override
    public Long createSalesperson(SalespersonCreateReqVO createReqVO) {
        // 插入
        SalespersonDO salesperson = SalespersonConvert.INSTANCE.convert(createReqVO);
        salespersonMapper.insert(salesperson);
        // 返回
        return salesperson.getId();
    }

    @Override
    public void updateSalesperson(SalespersonUpdateReqVO updateReqVO) {
        // 校验存在
        validateSalespersonExists(updateReqVO.getId());
        // 更新
        SalespersonDO updateObj = SalespersonConvert.INSTANCE.convert(updateReqVO);
        salespersonMapper.updateById(updateObj);
    }

    @Override
    public void deleteSalesperson(Long id) {
        // 校验存在
        validateSalespersonExists(id);
        // 删除
        salespersonMapper.deleteById(id);
    }

    private void validateSalespersonExists(Long id) {
        if (salespersonMapper.selectById(id) == null) {
            throw exception(SALESPERSON_NOT_EXISTS);
        }
    }

    @Override
    public SalespersonDO getSalesperson(Long id) {
        return salespersonMapper.selectById(id);
    }

    @Override
    public List<SalespersonDO> getSalespersonList(Collection<Long> ids) {
        return salespersonMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<SalespersonDO> getSalespersonPage(SalespersonPageReqVO pageReqVO) {
        return salespersonMapper.selectPage(pageReqVO);
    }

    @Override
    public List<SalespersonDO> getSalespersonList(SalespersonExportReqVO exportReqVO) {
        return salespersonMapper.selectList(exportReqVO);
    }

}
