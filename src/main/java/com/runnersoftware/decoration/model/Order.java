package com.runnersoftware.decoration.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @author HHY
 */
@ApiModel("订单实体类")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Order {

    @ApiModelProperty("订单id")
    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;
    @ApiModelProperty("装修组id")
    private Long materialGroupId;
    @ApiModelProperty("用户id")
    private Long userId;
    @ApiModelProperty("订单总价")
    private Float total;
    @ApiModelProperty("订单状态")
    private String status;
    @ApiModelProperty("订单创建时间")
    private Date createTime;

}
