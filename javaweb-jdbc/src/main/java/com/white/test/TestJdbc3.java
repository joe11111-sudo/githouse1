package com.white.test;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestJdbc3 {

    @Test
    public void test() throws Exception {
        //配置信息
        String url = "jdbc:mysql://localhost:3306/jdbc?useUnicode=true&characterEncoding=utf-8";
        String username = "root";
        String password = "whitepanther";

        Connection connection = null;
        try {
            //加载驱动
            Class.forName("com.mysql.jdbc.Driver");
            //连接数据库
            connection = DriverManager.getConnection(url, username, password);

            //通知数据库开启事务，false
            connection.setAutoCommit(false);

            String sql = "update account set money = money-100 where name='A'";
            connection.prepareStatement(sql).executeUpdate();

            //制造错误
           // int i = 1 / 0;

            String sql2 = "update account set money = money-100 where name='B'";
            connection.prepareStatement(sql2).executeUpdate();

            connection.commit();    //以上两条sql都执行成功了，就提交事务
            System.out.println("success");
        //如果错误，就回滚
        }catch(Exception e){
            connection.rollback();
            e.printStackTrace();
            }finally {
            connection.close();
        }
        }
}