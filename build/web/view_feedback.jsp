<%-- 
    Document   : view_feedback
    Created on : 27 Apr, 2025, 11:54:56 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback List</title>
         <%@ include file="navbar.jsp" %>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
      body {
    background-image: url(feedback.jpeg);
    margin: 0;
    padding: 0;
}

.container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    width: 70%;
    margin-top: 20px; /* Adjust margin to prevent navbar from overlapping */
}
        h3 {
            text-align: center;
            color: #096187;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h3>Feedback List</h3>
    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>Feedback ID</th>
                <th>User Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>

        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/car_rental_system", "root", "root");

                String query = "SELECT * FROM feedback";
                PreparedStatement ps = cn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("fname") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("message") %></td>
                <td><%= rs.getString("submitted_at") %></td>
            </tr>
        <%
                }
                rs.close();
                ps.close();
                cn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='5' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>

        </tbody>
    </table>
</div>

</body>
</html>