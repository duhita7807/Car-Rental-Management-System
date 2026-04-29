s<%-- 
    Document   : view_user
    Created on : 27 Apr, 2025, 11:52:44 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <%@ include file="navbar.jsp" %>
    <link rel="stylesheet" href="bootstrap.min.css">
    
    
    <style>
   body {
    background: linear-gradient(135deg, #096187, #1E3C72);
    margin: 0;
    padding: 0;
}

.container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    width: 70%;
    margin: 20px auto; /* Adjust margin to prevent navbar from overlapping */
}

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 70%;
        }
        h3 {
            text-align: center;
            color: #096187;
            margin-bottom: 20px;
        }
        table img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
    </style>
</head>
<body>

<div class="container">
    <h3>User List</h3>
    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Profile Image</th>
            </tr>
        </thead>
        <tbody>

        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/car_rental_system", "root", "root");

                String query = "SELECT * FROM ureg";
                PreparedStatement ps = cn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("fname") %></td>
                <td><%= rs.getString("addres") %></td>
                <td><%= rs.getString("ctno") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("gender") %></td>
                
                
            </tr>
        <%
                }
                rs.close();
                ps.close();
                cn.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='6' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>

        </tbody>
    </table>
</div>

</body>
</html>
