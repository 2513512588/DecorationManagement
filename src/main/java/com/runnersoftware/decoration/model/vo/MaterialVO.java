package com.runnersoftware.decoration.model.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.runnersoftware.decoration.model.Material;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MaterialVO {

        @JsonSerialize(using= ToStringSerializer.class)
        private Long groupId;
        private List<Material> materials;

}
