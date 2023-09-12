package cn.iocoder.yudao.module.operation.controller.admin.salesperson.vo;

import lombok.*;
import java.util.*;
import io.swagger.v3.oas.annotations.media.Schema;
import javax.validation.constraints.*;

@Schema(description = "管理后台 - 顾问创建 Request VO")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class SalespersonCreateReqVO extends SalespersonBaseVO {

}
