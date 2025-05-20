<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String firstName = (String) session.getAttribute("firstName");
    String userName = (String) session.getAttribute("userName");
    String dateOfBirth = (String) session.getAttribute("dateOfBirth");
    String accountNumber = (String) session.getAttribute("accountNumber");
    Double balance = (Double) session.getAttribute("balance");

    if (firstName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    java.util.Calendar calendar = java.util.Calendar.getInstance();
    int hour = calendar.get(java.util.Calendar.HOUR_OF_DAY);

    String greeting;
    if (hour >= 5 && hour < 12) {
        greeting = "Good Morning";
    } else if (hour >= 12 && hour < 17) {
        greeting = "Good Afternoon";
    } else if (hour >= 17 && hour < 21) {
        greeting = "Good Evening";
    } else {
        greeting = "Good Night";
    }

    String greetingMessage = greeting + ", " + firstName;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>User Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css" />
</head>
<body>
    <div class="dashboard-container">
        <h1 class="greeting-text"><%= greetingMessage %></h1>

        <div class="user-info">
            <p><strong>First Name:</strong> <%= firstName %></p>
            <p><strong>Username:</strong> <%= userName %></p>
            <p><strong>Date of Birth:</strong> <%= dateOfBirth %></p>
            <p><strong>Account Number:</strong> <%= accountNumber %></p>
            <p><strong>Balance:</strong> ₹<%= balance %></p>
        </div>

        <div class="actions">
            <form action="sendMoney" method="get">
                <button type="submit" class="action-btn">Send Money</button>
            </form>
            <form action="receiveMoney" method="get">
                <button type="submit" class="action-btn">Receive Money</button>
            </form>
            <form action="transactions" method="get">
                <button type="submit" class="action-btn">View All Transactions</button>
            </form>
            <form action="logout" method="post">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </div>
    </div>
</body>
</html>
