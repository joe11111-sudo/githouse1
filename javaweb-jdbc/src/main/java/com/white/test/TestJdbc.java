package com.white.test;

import java.sql.*;

import static java.lang.Class.forName;

public class TestJdbc {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //配置信息
        String url ="jdbc:mysql://localhost:3306/jdbc?useUnicode=true&SSL=true;characterEncoding=utf-8&SSL=true;";
        String username="root";
        String password = "123456";

        //加载驱动
        Class.forName("com.mysql.jdbc.Driver");
        //连接数据库
        Connection connection = DriverManager.getConnection(url, username, password);

        //向数据库发送sql的对象statement
        Statement statement = connection.createStatement();

        //编写sql
        String sql="select * from users";

        String sql2="delete from users where id = 4";
        //记得要update
        int i = statement.executeUpdate(sql2);

        //执行sql,返回一个结果-resultset
        ResultSet rs = statement.executeQuery(sql);

        while(rs.next()){
            System.out.println("id="+rs.getObject("id"));
            System.out.println("id="+rs.getObject("name"));
            System.out.println("id="+rs.getObject("password"));
            System.out.println("id="+rs.getObject("email"));
            System.out.println("id="+rs.getObject("birthday"));

        }
        //关闭资源
        rs.close();
        statement.close();
        connection.close();


    }
}
