package com.hrms.service;

import com.hrms.bean.User;
import com.hrms.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User selectUserByUsernameAndPassword(String username, String password) {
        return userMapper.selectUserByUsernameAndPassword(username, password);
    }


    public User getCurrentUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("currentUser");
            if (user != null) {
                return user;
            }
        }
        throw new RuntimeException("当前用户未登录");
    }

    public void updateUserEmail(User user) {
        userMapper.updateUserEmail(user.getId(), user.getUsername(), user.getEmail());
        System.out.println("我被改了");
    }

}

