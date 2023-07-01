package com.white.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineCounterListener implements HttpSessionListener {
    @Override //看你的一举一动
    //一但创建session就会触发一次这个事件
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext ctx = se.getSession().getServletContext();

        System.out.println(se.getSession().getId());


        Integer onlineCount = (Integer)ctx.getAttribute("OnlineCount");

        if(onlineCount ==null){
            onlineCount = new Integer(1);

        }else{
            int count = onlineCount.intValue();
            onlineCount = new Integer(count+1);
        }

        ctx.setAttribute("OnlineCount",onlineCount);


    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        ServletContext ctx = se.getSession().getServletContext();
        Integer onlineCount = (Integer)ctx.getAttribute("OnlineCount");

        if(onlineCount ==null){
            onlineCount = new Integer(1);

        }else{
            int count = onlineCount.intValue();
            onlineCount = new Integer(count-1);
        }

       ctx.setAttribute("OnlineCount",onlineCount);

    }
}
