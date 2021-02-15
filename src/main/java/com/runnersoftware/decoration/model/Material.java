package com.runnersoftware.decoration.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @author HHY
 */
@ApiModel("装修材料实体类")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Material {

    @ApiModelProperty("装修材料id")
    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;
    @ApiModelProperty("装修材料名字")
    private String name;
    @ApiModelProperty("装修材料描述")
    private String description;
    @ApiModelProperty("装修材料组id")
    @JsonSerialize(using= ToStringSerializer.class)
    private Long groupId;
    @ApiModelProperty("装修材料设计师id")
    private Long designerId;
    @ApiModelProperty("装修材料图片")
    private String cover;
    @ApiModelProperty("装修材料价格")
    private Double price;

}
