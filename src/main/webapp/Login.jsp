<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@ include file="All_Content/allLinks.jsp"%>
</head>
<body>
	<%@ include file="All_Content/Navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>


					<%
					String im = (String) session.getAttribute("login-failed");
					if (im != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=im%></div>
					<%
					session.removeAttribute("login-failed");
					}
					%>
					<%
					String withoutLogin = (String) session.getAttribute("Login-error");
					if (withoutLogin != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>

					<%
					session.removeAttribute("Login-error");
					}
					%>
					<%
						String lgMsg=(String)session.getAttribute("logoutMsg");
						if(lgMsg!=null){%>
							<div class="alert alert-danger" role="alert"><%=lgMsg%></div>
							
						<%
							session.removeAttribute("logoutMsg");
						}
					%>




					<div class="card-body">
						<form action="LoginServlet" method="post">


							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" required>

							</div>

							<div class="form-group">

								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" required>
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
								<br>
								<a href="ForgotPassword.jsp"><button type="button"
								class="btn btn-danger badge-pill btn-block">Forgot Password</button></a>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="All_Content/footer.jsp"%>




</body>
</html>