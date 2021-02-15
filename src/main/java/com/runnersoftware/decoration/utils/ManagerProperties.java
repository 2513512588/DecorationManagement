package com.runnersoftware.decoration.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ManagerProperties implements Serializable {

    private String username;
    private String password;



}
