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


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer note_id=Integer.parseInt(request.getParameter("note_id"));
		addNotesDao dao=new addNotesDao(DBConnect.getConn());
		boolean f=dao.NoteDelete(note_id);
		HttpSession session=null;
		if(f) {
			session=request.getSession();
			session.setAttribute("updateMsg", "Note Delete Successfully...");
			response.sendRedirect("ShowNotes.jsp");
		}else {
			session=request.getSession();
			session.setAttribute("WrongMsg","Something went wrong on server");
			response.sendRedirect("ShowNotes.jsp");
		}
	}

	

}
