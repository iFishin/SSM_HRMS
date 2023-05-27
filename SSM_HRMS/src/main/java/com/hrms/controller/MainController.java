package com.hrms.controller;

import com.hrms.bean.User;
import com.hrms.service.UserService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/")
public class MainController {

    @Autowired
    UserService userService;

    /**
     * 跳转到修改头像页面
     */
    @RequestMapping(value = "/update")
    public String emailUpdate() {
        return "emailUpdate";
    }

    /**
     * 跳转到修改头像页面
     */
    @RequestMapping(value = "/login")
    public String toLogin() {
        return "login";
    }

    /**
     * 处理 AJAX 请求，更新用户邮箱
     */
    @RequestMapping(value = "/change-email", method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg changeEmail(@RequestParam("email") String email, HttpSession session) {
        // 在这里进行更新操作，并返回响应消息
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return JsonMsg.fail().addInfo("error", "未登录");
        }
        user.setEmail(email);
        userService.updateUserEmail(user);
        System.out.println("update:"+user);
        return JsonMsg.success().addInfo("newEmail", email);
    }

}