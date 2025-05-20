<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css" />
</head>
<body>
    <div class="register-container">
        <h2>To start your journey register here</h2>
        <p class="bank-message">Your future in secure banking starts here.</p>

        <form action="register" method="post">
            <input type="text" name="fullName" placeholder="Full Name" required />
            <input type="date" name="dateOfBirth" required />
            <input type="text" name="occupation" placeholder="Occupation" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="text" name="phone" placeholder="Phone Number" required />
            <input type="text" name="address" placeholder="Residential Address" required />
            <button type="submit">Create Account</button>
        </form>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error-message"><%= error %></div>
        <%
            }
        %>
    </div>
</body>
</html>
