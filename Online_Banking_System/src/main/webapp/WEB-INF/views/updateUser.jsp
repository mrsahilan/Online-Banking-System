<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.nit.entity.Users" %>
<%
    Users user = (Users) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #FF9933, white, #138808);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        input[type="text"], input[type="email"], input[type="date"] {
            width: 100%;
            padding: 6px 14px; /* reduced top/bottom padding, increased left/right */
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        input[readonly] {
            background-color: #f3f3f3;
            color: #555;
            cursor: not-allowed;
        }

        button {
            background-color: #FF9933;
            color: white;
            padding: 10px 20px;
            margin-top: 20px;
            width: 100%;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #e67e00;
        }

        .back-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: #138808;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update User Details</h2>

    <form action="updateUser" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>"/>
        <input type="hidden" name="userName" value="<%= user.getUserName() %>" />

        <label for="userName">User Name:</label>
        <input type="text" id="userName" value="<%= user.getUserName() %>" readonly/>

        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" value="<%= user.getFullName() %>" required/>

        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth" value="<%= user.getDateOfBirth() %>" required/>

        <label for="occupation">Occupation:</label>
        <input type="text" id="occupation" name="occupation" value="<%= user.getOccupation() %>"/>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required/>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="<%= user.getPhone() %>"/>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= user.getAddress() %>"/>

        <button type="submit">Update</button>
    </form>

    <a class="back-link" href="adminDashboard">Cancel</a>
</div>
</body>
</html>
