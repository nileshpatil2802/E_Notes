<%@page import="com.User.addNotes"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.dao.addNotesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes Page</title>
<%@ include file="All_Content/allLinks.jsp"%>
</head>
<body>

<%
	Integer noteid=Integer.parseInt(request.getParameter("note_id"));
	addNotesDao dao=new addNotesDao(DBConnect.getConn());
	addNotes ad=dao.getDataById(noteid);
%>


	<%@ include file="All_Content/Navbar.jsp"%>

	<h1 class="text-center mt-4">Edit Your Notes</h1>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form action="EditNotesServlet" method="post">
				
					<input type="hidden" value="<%=noteid %>" name="id">
				
					<div class="form-group">

						<label for="exampleInputEmail1">Enter Title</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="title" required="required" value="<%= ad.getTitle()%>">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Enter Content</label>
						<textarea rows="10" cols="" class="form-control" name="content"
							required="required"  ><%= ad.getContent()%></textarea>
					</div>
					<div class="container text-center">
						<button type="submit" class="btn btn-primary mb-5">Edit
							Notes</button>

					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>