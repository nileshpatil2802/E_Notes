<%@page import="com.User.addNotes"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.addNotesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	response.sendRedirect("Login.jsp");
	session.setAttribute("Login-error", "Please Login Here...");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@ include file="All_Content/allLinks.jsp"%>
</head>
<body>
	<%@ include file="All_Content/Navbar.jsp"%>

	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>
	
	<%
	String wrongMsg = (String) session.getAttribute("WrongMsg");
	if (wrongMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
	<%
	session.removeAttribute("WrongMsg");
	}
	%>
	
	
	
	

	<div class="container">
		<h2 class="text-center">All Notes</h2>
		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					addNotesDao ob = new addNotesDao(DBConnect.getConn());
					List<addNotes> ad = ob.getData(user3.getId());
					for (addNotes a : ad) {
				%>
				<div class="card mt-3">
					<img alt="" src="IMG/Notepad.webp"
						class="card-img-top mt-2 mx-auto" style="max-width: 100px;">
					<div class="card-body p-4">




						<h5 class="card-title"><%=a.getTitle()%>.
						</h5>
						<p><%=a.getContent()%>.
						</p>


						<p>
							<b class="text-success">Published By: <%=user3.getName()%>.
							</b><br> <b class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date: <%=a.getPdate()%>.
							</b><br> <b class="text-success"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=a.getId() %>" class="btn btn-danger">Delete</a>
							
							 <a
								href="Edit.jsp?note_id=<%=a.getId()%>" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>


			</div>
		</div>
	</div>

</body>
</html>