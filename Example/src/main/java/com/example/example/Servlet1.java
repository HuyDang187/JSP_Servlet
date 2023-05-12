package com.example.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class Servlet1 extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String s = request.getParameter("1");
        String qs = request.getQueryString();
        String strHost=request.getHeader("host");
        PrintWriter out = response.getWriter();

        out.println("<HTML>");
        out.println("<HEAD><TITLE>Hello World</TITLE></HEAD>");
        out.println("<BODY>");
        out.println("<B>Hello</B>"+s);
        out.println("<br><B>Query String: </B></br>"+qs);
        out.println("<br> Header </br> "+strHost);
        out.println("</BODY></HTML>");
    }
}
