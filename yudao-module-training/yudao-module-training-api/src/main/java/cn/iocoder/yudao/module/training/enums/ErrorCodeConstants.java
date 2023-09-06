package cn.iocoder.yudao.module.training.enums;

import cn.iocoder.yudao.framework.common.exception.ErrorCode;

public interface ErrorCodeConstants {
    ErrorCode STORE_NOT_EXISTS = new ErrorCode(1020001000, "门店不存在");
    ErrorCode COACH_NOT_EXISTS = new ErrorCode(1020101000, "教练不存在");
    ErrorCode STUDENT_NOT_EXISTS = new ErrorCode(1020201000, "学员不存在");
}
