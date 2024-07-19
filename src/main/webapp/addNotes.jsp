<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
	if(user1 ==null){
		response.sendRedirect("Login.jsp");
		session.setAttribute("Login-error","Please Login Here...");
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@ include file="All_Content/allLinks.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="All_Content/Navbar.jsp"%>

		<h1 class="text-center mt-4">Add Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="form-group">

							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");
							
							if(us!=null){%>
								<input type="hidden" value="<%=us.getId()%>" name="uId">
							
							<%}%>
	
							

							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="10" cols="" class="form-control" name="content"
								required="required"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary mb-5">Add
								Notes</button>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="All_Content/footer.jsp"%>
</body>
</html>