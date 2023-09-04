package org.lanqiao.listener;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//@WebListener
public class OnlineListener implements HttpSessionAttributeListener, HttpSessionListener {
    private int count = 0;
    @Override
    public void attributeAdded(HttpSessionBindingEvent se) {
        count++;
//        System.out.println("在线人数+1");
        se.getSession().getServletContext().setAttribute("onLineCount", count);
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent se) {
//        count--;
//        System.out.println("在线人数-1");
//        se.getSession().getServletContext().setAttribute("onLineCount", count);
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {

    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        if(count > 0) {
            count--;
//            System.out.println("在线人数--1");
            se.getSession().getServletContext().setAttribute("onLineCount", count);
        }
    }
}
