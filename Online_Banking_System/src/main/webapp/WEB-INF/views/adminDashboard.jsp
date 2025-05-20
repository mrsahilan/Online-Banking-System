<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.nit.entity.Users"%>
<%@ page import="com.nit.entity.Account"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/adminDashboard.css" />
</head>
<body>
<div class="dashboard-container">
    <h1>Welcome to Raysam Financial Bank Admin Dashboard</h1>
    <table>
        <thead>
        <tr>
            <th>User ID</th>
            <th>Full Name</th>
            <th>User Name</th>
            <th>Email</th>
            <th>Date of Birth</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Account Number</th>
            <th>Balance</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Users> userList = (List<Users>) request.getAttribute("users");
            if (userList != null && !userList.isEmpty()) {
                for (Users user : userList) {
                    Account account = user.getAccount();
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getFullName() %></td>
            <td><%= user.getUserName() %></td>
            <td><%= user.getEmail() != null ? user.getEmail() : "N/A" %></td>
            <td><%= user.getDateOfBirth() != null ? user.getDateOfBirth() : "N/A" %></td>
            <td><%= user.getPhone() != null ? user.getPhone() : "N/A" %></td>
            <td><%= user.getAddress() != null ? user.getAddress() : "N/A" %></td>
            <td><%= account != null ? account.getAccountNumber() : "No Account" %></td>
            <td><%= account != null ? account.getBalance() : "N/A" %></td>
            <td>
                <a href="updateUser?id=<%= user.getId() %>" class="btn update-btn">Update User</a>
                <% if (account != null) { %>
                    <a href="updateAccount?accountNumber=<%= account.getAccountNumber() %>" class="btn update-btn">Update Account</a>
                <% } %>
                <a href="deleteUser?id=<%= user.getId() %>" class="btn delete-btn"
                   onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="10" style="text-align: center;">No users found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <br><br>
    <div class="logout-container">
        <form action="adminLogout" method="get">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
</div>
</body>
</html>
