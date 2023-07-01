package com.white.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取前端请求
        String username = req.getParameter("username");
        if (username.equals("admin")) {   //登入成功
            req.getSession().setAttribute("USER_SESSION", req.getSession().getId());
            resp.sendRedirect("/sys/success.jsp");   //跳转页面

        } else {  //登入失败

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}