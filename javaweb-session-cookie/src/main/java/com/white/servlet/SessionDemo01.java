package com.white.servlet;

import com.white.pojo.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionDemo01 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决乱码问题
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;chatset=utf-8");

        //得到Session
        HttpSession session = req.getSession();

        //给Session中存东西
        session.setAttribute("name",new Person("白豹",2));

        //获取Session的id
        String sessionId = session.getId();

        //判断Session是不是新创建
        if(session.isNew()){
            resp.getWriter().write("session创建成功，ID："+sessionId);
        }else{
            resp.getWriter().write("session以及在服务器中存在了，ID："+sessionId);
        }

        //Session 创建的时候 做的事情
        //Cookie cookie = new Cookie("JSESSIONID",sessionID);
        //resp.addCookie(cookie);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
