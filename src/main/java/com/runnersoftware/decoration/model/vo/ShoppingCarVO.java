package com.runnersoftware.decoration.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingCarVO {

    private Integer total;
    private Long materialGroupId;
    private MaterialVO materialVO;
    private Double price;


}
