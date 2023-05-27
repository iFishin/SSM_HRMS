package com.hrms.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import com.hrms.bean.Department;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class MyBatisTest {

    private static SqlSessionFactory sessionFactory;

    @BeforeClass
    public static void setUp() {
        try (InputStream inputStream = MyBatisTest.class.getResourceAsStream("/mybatis-config.xml")) {
            Properties props = new Properties();
            props.load(inputStream);
            sessionFactory = new SqlSessionFactoryBuilder().build(inputStream, props);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @AfterClass
    public static void tearDown() {
        sessionFactory = null;
    }

    @Test
    public void testSelectDeptsByLimitAndOffset() {
        try (SqlSession session = sessionFactory.openSession()) {
            RowBounds rowBounds = new RowBounds(0,10);
            List<Department> departments = session.selectList("selectDeptsByLimitAndOffset", null, rowBounds);
            for (Department department : departments) {
                System.out.println(department.getDeptId() + ", " + department.getDeptName() + ", " + department.getDeptLeader());
            }
        }
    }

}
