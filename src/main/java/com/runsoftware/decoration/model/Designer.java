package com.runsoftware.decoration.model;

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
@ApiModel("设计师实体类")
@Data
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class Designer {


    @ApiModelProperty("设计师id")
    private Long id;
    @ApiModelProperty("设计师名字")
    private String name;
    @ApiModelProperty("设计师描述")
    private String description;
    @ApiModelProperty("设计师添加时间")
    private Date createTime;
    @ApiModelProperty("设计师是否启用")
    private Boolean enable;

}
