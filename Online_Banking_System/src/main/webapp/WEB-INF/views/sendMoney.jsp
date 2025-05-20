<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Send Money</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/sendMoney.css" />
</head>
<body>
    <div class="send-money-container">
        <h2>Send Money</h2>

        <form action="validateReceiver" method="post" class="send-money-form">
            <label>Receiver Name:</label><br>
            <input type="text" name="receiverName" required /><br><br>

            <label>Receiver Account Number:</label><br>
            <input type="text" name="receiverAccountNumber" required /><br><br>

            <!-- Button group: Send Money and Dashboard -->
            <div class="button-group">
                <input type="submit" value="Send Money" class="btn send-money-btn" />
                <a href="${pageContext.request.contextPath}/dashboard" class="btn dashboard-btn">Dashboard</a>
            </div>
        </form>

        <% String error = (String) request.getAttribute("errorMessage");
           if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>
    </div>
</body>
</html>
