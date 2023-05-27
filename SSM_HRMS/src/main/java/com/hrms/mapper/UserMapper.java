package com.hrms.mapper;

import com.hrms.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    /**
     * =================================查询============================================
     */
    User selectUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * =================================更新============================================
     */
    void updateUserEmail(@Param("id") Integer id, @Param("username") String username, @Param("email") String email);

}
