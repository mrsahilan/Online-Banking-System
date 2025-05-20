<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Confirm Transaction</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/confirmPassword.css" />
</head>
<body>
    <div class="confirm-container">
        <h2>Confirm Transaction</h2>

        <form action="processTransaction" method="post">
            <!-- Hidden to keep receiver info across requests -->
            <input type="hidden" name="receiverAccountNumber"
                   value="<%= request.getAttribute("receiverAccountNumber") %>">

            <label>Enter Amount:</label>
            <input type="number" name="amount" required min="1" step="0.01" />

            <label>Your Password:</label>
            <input type="password" name="password" required />

            <input type="submit" value="Confirm & Send" class="submit-btn" />
        </form>

        <!-- Dashboard and Logout buttons -->
        <div class="button-row">
            <a href="/dashboard" class="btn-saffron">Dashboard</a>

            <!-- Logout form styled to match the dashboard button -->
            <form action="/logout" method="post" style="flex: 1; margin: 0; padding: 0;">
                <button type="submit" class="btn-green" style="width: 100%;">Logout</button>
            </form>
        </div>

        <!-- Message display -->
        <% 
            String error = (String) request.getAttribute("errorMessage");
            String success = (String) request.getAttribute("successMessage");

            if (error != null) { 
        %>
            <p class="error"><%= error %></p>
        <% 
            } else if (success != null) { 
        %>
            <p class="success"><%= success %></p>
        <% 
            } 
        %>
    </div>
</body>
</html>
