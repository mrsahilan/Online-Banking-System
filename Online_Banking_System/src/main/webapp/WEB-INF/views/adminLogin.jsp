<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminLogin.css" />
</head>
<body>
	<div class="admin-login-container">
		<h2>Admin Login</h2>
		<form action="adminLogin" method="post">
			<input type="text" name="adminUserName" placeholder="Admin Username"
				required /> <input type="password" name="adminPassword"
				placeholder="Admin Password" required />
			<button type="submit">Login</button>
			<% String error = (String) request.getAttribute("error");
           if (error != null) { %>
			<div class="error-message"><%= error %></div>
			<% } %>
		</form>
		<div class="button-group">
			<a href="login" class="button-link">Home</a>
		</div>
	</div>
</body>
</html>
