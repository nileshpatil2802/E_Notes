<%@page import="com.Db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("IMG/note1.jpg");
	background-size: 100%;
	height: 710px;
}

.text-center {
	position: relative;
	top:35%;
}
.text-danger{
	font-family: 'Elephant', serif;
}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<%@ include file="All_Content/allLinks.jsp"%>
</head>
<body>


	
   
	<%@ include file="All_Content/Navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-danger"><i class="fa fa-book" aria-hidden="true"></i> E-Notes: Save Your Notes</h1>
			<a href="Login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
				Login</a><a href="Register.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>
				Register</a>

		</div>
	</div>
	<%@ include file="All_Content/footer.jsp"%>
</body>
</html>