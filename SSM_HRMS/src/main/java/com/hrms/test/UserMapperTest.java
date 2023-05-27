package com.hrms.test;

import com.hrms.bean.User;
import com.hrms.mapper.UserMapper;
import com.hrms.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class UserMapperTest {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService userService;

    @Test
    public void test() {
        System.out.println("##########fish############");
        User user = userService.selectUserByUsernameAndPassword(
                "admin", "fish");
        System.out.println(user);
    }

    @Test
    public void test1() {
        System.out.println("-------------------");
        System.out.println(userMapper.selectUserByUsernameAndPassword("admin","fish"));
    }







}
