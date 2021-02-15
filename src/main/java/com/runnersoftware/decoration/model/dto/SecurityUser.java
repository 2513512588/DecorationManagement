package com.runnersoftware.decoration.model.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class SecurityUser extends User {

    private final com.runnersoftware.decoration.model.User user;

    public SecurityUser(com.runnersoftware.decoration.model.User user, Collection<? extends GrantedAuthority> authorities) {
        super(user.getUsername(), user.getPassword(), authorities);
        this.user = user;
    }

    public com.runnersoftware.decoration.model.User getUser() {
        return user;
    }
}
