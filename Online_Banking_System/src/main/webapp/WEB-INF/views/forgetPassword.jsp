<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forget Password</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forgetPassword.css" />
</head>
<body>
    <div class="forget-password-container">
        <h2>Reset Your Password</h2>
        <form action="verifyUserDetails" method="post">
            <input type="email" name="email" placeholder="Email ID" required />
            <input type="text" name="username" placeholder="Username" required />
            <input type="text" name="birthYear" placeholder="Year of Birth (YYYY)" required />
            <button type="submit">Verify</button>
        </form>

        <% String verified = (String) request.getAttribute("verified");
           if ("true".equals(verified)) { %>
            <form action="changePassword" method="post">
                <input type="hidden" name="email" value="<%= request.getAttribute("email") %>" />
                <input type="password" name="newPassword" placeholder="New Password" required />
                <button type="submit">Change Password</button>
            </form>
        <% } else if ("false".equals(verified)) { %>
            <div class="error-message">Invalid details. Please try again.</div>
        <% } %>

        <div class="button-group">
            <a href="login" class="button-link">Home</a>
        </div>
    </div>
</body>
</html>
