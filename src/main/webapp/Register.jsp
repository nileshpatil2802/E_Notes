<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@ include file="All_Content/allLinks.jsp"%>
</head>
<body>

	<%@ include file="All_Content/Navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registration</h4>
					</div>






					<%
					String rm = (String) session.getAttribute("reg-success");
					if (rm != null) {
					%>
					<div class="alert alert-success" role="alert"><%= rm %><a href="Login.jsp">Click Here</a></div>
					<%
						session.removeAttribute("reg-success");
						
					}
					%>

					<%
					String fm = (String) session.getAttribute("failed-msg");
					if (fm != null) {
					%>
					<div class="alert alert-danger" role="alert"><%= fm %></div>
					<%
					session.removeAttribute("failed-msg");
					}
					%>



					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" id="exampleInputName"
									aria-describedby="NameHelp" name="uName" required>

							</div>

							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uEmail" required>

							</div>

							<div class="form-group">

								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="uPassword" required>
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="All_Content/footer.jsp"%>




</body>
</html>