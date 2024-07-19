package com.servlet;

import java.io.IOException;
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


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDetails us=new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		
		
		
		UserDao dao=new UserDao(DBConnect.getConn());
		UserDetails user=dao.loginUser(us);
		
		if(user != null) {
			HttpSession session=request.getSession();
			session.setAttribute("userD",user);
			
			response.sendRedirect("Home.jsp");
		}
		else {
			HttpSession session=request.getSession();
			session.setAttribute("login-failed", "Invalid UserName and Password");
			response.sendRedirect("Login.jsp");
		}
		
		
		
	}

}
