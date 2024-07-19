package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DBConnect;
import com.dao.addNotesDao;

@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Integer noteId = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			addNotesDao dao=new addNotesDao(DBConnect.getConn());
			boolean f=dao.NoteUpdate(noteId , title, content);
			
			if(f) {
				System.out.println("Data Update Successfully...");
				HttpSession session=request.getSession();
				session.setAttribute("updateMsg","Notes Update Successfully...");
				response.sendRedirect("ShowNotes.jsp");
			}
			else {
				System.out.println("Data not updated...");
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
