package com.runnersoftware.decoration.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @author HHY
 */
@ApiModel("设计师实体类")
@Data
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class Designer implements Serializable {


    @ApiModelProperty("设计师id")
    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;
    @ApiModelProperty("设计师名字")
    private String name;
    @ApiModelProperty("设计师描述")
    private String description;
    @ApiModelProperty("设计师添加时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT-8")
    private Date createTime;
    @ApiModelProperty("设计师是否启用")
    private Boolean enable;
    @ApiModelProperty("设计师图片")
    private String cover;
    @ApiModelProperty("用户名")
    private String username;
    @ApiModelProperty("用户密码")
    @JsonIgnore
    private String password;

}
