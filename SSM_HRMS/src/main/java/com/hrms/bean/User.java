package com.hrms.bean;

import java.sql.Timestamp;

public class User {
    private final Integer id;
    private final Timestamp createTime;
    private final Timestamp updateTime;
    private String username;
    private String password;
    private String email;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() { return email; }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }


    public User(Integer id, String username, String password, String email, Timestamp createTime, Timestamp updateTime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }


}
