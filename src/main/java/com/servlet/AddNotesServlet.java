package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Db.DBConnect;
import com.User.addNotes;
import com.dao.addNotesDao;

/**
 * Servlet implementation class AddNotesServlet
 */
@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uId"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		addNotesDao dao=new addNotesDao(DBConnect.getConn());
		boolean f=dao.AddNotes(title,content,uid);
		if(f) {
			System.out.println("Data Inserted");
			response.sendRedirect("ShowNotes.jsp");
		}else {
			System.out.println("Data Not Inserted");
		}
	}

}
