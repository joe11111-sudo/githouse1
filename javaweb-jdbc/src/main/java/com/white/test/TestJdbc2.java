package com.white.test;

import java.sql.*;

public class TestJdbc2 {
    public static void main(String[] args) throws Exception {
        //配置信息
        String url ="jdbc:mysql://localhost:3306/jdbc?useUnicode=true&characterEncoding=utf-8";
        String username="root";
        String password = "123456";

        //加载驱动
        Class.forName("com.mysql.jdbc.Driver");
        //连接数据库
        Connection connection = DriverManager.getConnection(url, username, password);

        //编写sql
        String sql = "insert into user(id,name,password,email,birthday) values(?,?,?,?,?);";

        //预编译
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setInt(1,2);  //给第一个占位符 的占位值为1
        preparedStatement.setString(2,"白豹");  //给第一个占位符 的占位值为2
        preparedStatement.setString(3,"123456");  //给第一个占位符 的占位值为3
        preparedStatement.setString(4,"23456@qq.com");  //给第一个占位符 的占位值为4
        preparedStatement.setDate(5,new Date(new java.util.Date().getTime()));  //给第一个占位符 的占位值为5

        //执行sql
        int  i = preparedStatement.executeUpdate();
        if (i>0){
            System.out.println("插入成功");
        }

        //关闭资源
        preparedStatement .close();
        connection.close();


    }
}
