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
@ApiModel("购物车实体类")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class ShoppingCar {

    @ApiModelProperty("购物车id")
    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;
    @ApiModelProperty("装修材料组id")
    private Long materialGroupId;
    @ApiModelProperty("用户id")
    private Long userId;
    @ApiModelProperty("购物车添加时间")
    private Date createTime;


}
