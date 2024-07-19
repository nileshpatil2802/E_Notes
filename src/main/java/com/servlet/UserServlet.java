package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.User.UserDetails;
import com.dao.UserDao;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String name=request.getParameter("uName");
		String email=request.getParameter("uEmail");
		String password=request.getParameter("uPassword");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		Connection conn = DBConnect.getConn();
		UserDao dao=new UserDao(conn);
		boolean f=dao.addUser(us);
		
		PrintWriter out=response.getWriter();
		HttpSession session;
		if(f) {
				 session=request.getSession();
				 session.setAttribute("reg-success", "Registration Successfully...");
				 response.sendRedirect("Register.jsp");
		}else {
				session=request.getSession();
				session.setAttribute("failed-msg", "Something went wrong on server");
				response.sendRedirect("Register.jsp");
		}
		
	}
}
