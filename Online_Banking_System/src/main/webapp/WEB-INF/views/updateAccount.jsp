<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.nit.entity.Account" %>
<%
    Account account = (Account) request.getAttribute("account");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Account</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #ff9933, #ffffff, #138808); /* National Flag Style */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #138808;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #0e6b06;
        }

        .cancel-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
        }

        .cancel-link:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Update Account Details</h2>

        <% if (error != null) { %>
            <div class="error-message"><%= error %></div>
        <% } %>

        <form action="updateAccount" method="post">
            <input type="hidden" name="accountNumber" value="<%= account.getAccountNumber() %>" />


            <label for="balance">Balance:</label>
            <input type="text" id="balance" name="balance" value="<%= account.getBalance() %>" required />

            <button type="submit">Update</button>
        </form>

        <a href="adminDashboard" class="cancel-link">Cancel</a>
    </div>
</body>
</html>
