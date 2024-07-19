<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
UserDetails user2 = (UserDetails) session.getAttribute("userD");
if (user2 == null) {
	response.sendRedirect("Login.jsp");
	session.setAttribute("Login-error", "Please Login Here...");
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@ include file="All_Content/allLinks.jsp"%>
</head>
<body>


	<div class="container-fluid">
		<%@ include file="All_Content/Navbar.jsp"%>
		<div class="card py-5 MY-5">
			<div class="card-body text-center">
				<img alt="homeImg" src="IMG/note-icon-23.jpg"
					class="img-fluid mx-auto" style="width: 400px;">
				<h1>START TAKING YOUR NOTES</h1>
				<a href="addNotes.jsp" class="btn btn-outline-primary">Start
					Here</a>
			</div>
		</div>
	</div>

	<%@ include file="All_Content/footer.jsp"%>
</body>
</html>