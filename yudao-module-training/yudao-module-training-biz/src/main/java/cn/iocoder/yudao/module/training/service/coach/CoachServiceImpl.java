package cn.iocoder.yudao.module.training.service.coach;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import org.springframework.validation.annotation.Validated;

import java.util.*;
import cn.iocoder.yudao.module.training.controller.admin.coach.vo.*;
import cn.iocoder.yudao.module.training.dal.dataobject.coach.CoachDO;
import cn.iocoder.yudao.framework.common.pojo.PageResult;

import cn.iocoder.yudao.module.training.convert.coach.CoachConvert;
import cn.iocoder.yudao.module.training.dal.mysql.coach.CoachMapper;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.training.enums.ErrorCodeConstants.*;

/**
 * 教练 Service 实现类
 *
 * @author 阿古旺
 */
@Service
@Validated
public class CoachServiceImpl implements CoachService {

    @Resource
    private CoachMapper coachMapper;

    @Override
    public Long createCoach(CoachCreateReqVO createReqVO) {
        // 插入
        CoachDO coach = CoachConvert.INSTANCE.convert(createReqVO);
        coachMapper.insert(coach);
        // 返回
        return coach.getId();
    }

    @Override
    public void updateCoach(CoachUpdateReqVO updateReqVO) {
        // 校验存在
        validateCoachExists(updateReqVO.getId());
        // 更新
        CoachDO updateObj = CoachConvert.INSTANCE.convert(updateReqVO);
        coachMapper.updateById(updateObj);
    }

    @Override
    public void deleteCoach(Long id) {
        // 校验存在
        validateCoachExists(id);
        // 删除
        coachMapper.deleteById(id);
    }

    private void validateCoachExists(Long id) {
        if (coachMapper.selectById(id) == null) {
            throw exception(COACH_NOT_EXISTS);
        }
    }

    @Override
    public CoachDO getCoach(Long id) {
        return coachMapper.selectById(id);
    }

    @Override
    public List<CoachDO> getCoachList(Collection<Long> ids) {
        return coachMapper.selectBatchIds(ids);
    }

    @Override
    public PageResult<CoachDO> getCoachPage(CoachPageReqVO pageReqVO) {
        return coachMapper.selectPage(pageReqVO);
    }

    @Override
    public List<CoachDO> getCoachList(CoachExportReqVO exportReqVO) {
        return coachMapper.selectList(exportReqVO);
    }

}
