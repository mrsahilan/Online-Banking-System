<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/success.css" />
</head>
<body>
    <div class="success-container">
        <h2>🎉 Welcome to Raysam Financial Bank!</h2>

        <%
            String fullName = (String) request.getAttribute("fullName");
            String userName = (String) request.getAttribute("userName");
            String accountNumber = String.valueOf(request.getAttribute("accountNumber"));
        %>

        <div class="success-message">
            <p>
                <strong>Congratulations <%= fullName %>!</strong><br>
                You have successfully opened your digital account with <strong>Raysam Financial Bank</strong>.
            </p>

            <p>
                🧾 Your new account number is:<br>
                <span class="account-number"><%= accountNumber %></span>
            </p>

            <p>
                🔐 Your secure username is:<br>
                <span class="username"><%= userName %></span><br>
                Please use this username along with your password to log in.
            </p>

            <p class="login-reminder">
                ✅ Try logging in now using your <strong>username</strong> and <strong>password</strong>.
            </p>

            <p class="thankyou">🏦 Thank you for banking with us — where your trust is our asset!</p>
        </div>

        <div class="login-button-container">
            <a href="login" class="login-button">Go to Login</a>
        </div>
    </div>
</body>
</html>
