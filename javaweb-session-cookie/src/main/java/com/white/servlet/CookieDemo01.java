package com.white.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

public class CookieDemo01 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //服务器，告诉你，你来的时间，把这个时间封装成为一个信件，你下带来，我就知道你来了
        //解决中文乱码
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        PrintWriter out = resp.getWriter();

        //Cookie,服务器从客户端获取
        Cookie[] cookies = req.getCookies();    //返回数组，说明存在多个

        //判断cookie是否存在
        if(cookies!= null){
            //如果存在怎么办、
            out.write("您上一次访问时间是：");

            for (int i = 0 ;i<cookies.length;i++){
                Cookie cookie = cookies[i];
                //获取cookie的名字
                if(cookie.getName().equals("lastLoginTime")){
                    //获取cookie中的值
                    long lastLoginTime = Long.parseLong(cookie.getValue());
                    Date date = new Date(lastLoginTime);
                    out.write(date.toLocaleString());
                    //解码
                    //out.write(URLDecoder.decode(cookie.getValue(),"utf-8"));
                }
            }
        }else{
            out.write("这是您第一次访问");
        }

        //服务器给客户端响应一个cookie
       Cookie cookie =  new Cookie("lastLoginTime",System.currentTimeMillis()+"");

        //中文编码
        //Cookie cookie =  new Cookie("name", URLEncoder.encode("白豹","utf-8"));

       //cookie有效期1天
        cookie.setMaxAge(24*60*60);

        resp.addCookie(cookie);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
