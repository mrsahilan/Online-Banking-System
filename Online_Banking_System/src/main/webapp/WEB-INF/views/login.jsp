<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/userLogin.css" />
</head>
<body>
	<div class="animated-background"></div>

	<div class="flex-container">
		<!-- Login Box -->
		<div class="login-container">
			<h1>Welcome to Raysam Financial Bank</h1>
			<p class="tagline">Secure Banking Starts Here. Your money, your
				control.</p>

			<h2>
				<b>User Login</b>
			</h2>
			<form action="login" method="post">
				<input type="text" name="userName" placeholder="Enter User Name"
					required /> <input type="password" name="password"
					placeholder="Enter Password" required />

				<div class="button-group">
					<button type="submit">Login</button>
					<a href="register" class="button-link">Register</a>
				</div>

				<div class="admin-login">
					<a href="forgetPassword" class="admin-button forget-password">Forget
						Password</a> <a href="adminLogin" class="admin-button admin-login-btn">Admin
						Login</a>
				</div>

				<% String error = (String) request.getAttribute("error");
                   if (error != null) { %>
				<div class="error-message"><%= error %></div>
				<% } %>
			</form>
		</div>

		<!-- Info/Warning Box -->
		<div class="login-container info-box">
			<h2>🔐 Safe & Smart Banking</h2>
			<ul class="info-list">
				<li>24/7 Secure Access to Your Account from Anywhere</li>
				<li>Real-Time Balance & Transaction Alerts via SMS/Email</li>
				<li>Instant Money Transfers via NEFT, IMPS & UPI</li>
				<li>Detailed Statement View & PDF Downloads Anytime</li>
				<!-- <li>Instantly Block or Unblock Your Debit Card in Case of
					Loss</li> -->
				<li>Two-Factor Authentication for Every Login</li>
			</ul>
			<div class="security-warning">
				<h4>⚠️ Security Notice</h4>
				<p>Never share your username or password with anyone. Always log
					out after use.</p>
			</div>
		</div>
	</div>
</body>
</html>
