package cn.iocoder.yudao.module.training.service.coach;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.training.controller.admin.coach.vo.CoachCreateReqVO;
import cn.iocoder.yudao.module.training.controller.admin.coach.vo.CoachExportReqVO;
import cn.iocoder.yudao.module.training.controller.admin.coach.vo.CoachPageReqVO;
import cn.iocoder.yudao.module.training.controller.admin.coach.vo.CoachUpdateReqVO;
import cn.iocoder.yudao.module.training.dal.dataobject.coach.CoachDO;

import javax.validation.Valid;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 教练 Service 接口
 *
 * @author 阿古旺
 */
public interface CoachService {

    /**
     * 创建教练
     *
     * @param createReqVO 创建信息
     * @return 编号
     */
    Long createCoach(@Valid CoachCreateReqVO createReqVO);

    /**
     * 更新教练
     *
     * @param updateReqVO 更新信息
     */
    void updateCoach(@Valid CoachUpdateReqVO updateReqVO);

    /**
     * 删除教练
     *
     * @param id 编号
     */
    void deleteCoach(Long id);

    /**
     * 获得教练
     *
     * @param id 编号
     * @return 教练
     */
    CoachDO getCoach(Long id);

    /**
     * 获得教练列表
     *
     * @param ids 编号
     * @return 教练列表
     */
    List<CoachDO> getCoachList(Collection<Long> ids);

    /**
     * 获得教练 Map
     *
     * @param ids 编号
     * @return 教练 Map
     */
    Map<Long, CoachDO> getCoachMap(Collection<Long> ids);

    /**
     * 获得教练分页
     *
     * @param pageReqVO 分页查询
     * @return 教练分页
     */
    PageResult<CoachDO> getCoachPage(CoachPageReqVO pageReqVO);

    /**
     * 获得教练列表, 用于 Excel 导出
     *
     * @param exportReqVO 查询条件
     * @return 教练列表
     */
    List<CoachDO> getCoachList(CoachExportReqVO exportReqVO);

}
