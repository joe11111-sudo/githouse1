package com.white.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class sysFilter implements Filter{

    public sysFilter() {
        super();
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

       if(request.getSession().getAttribute("USER_SESSION")==null){
                response.sendRedirect("/error.jsp");
        }

        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
