<%-- 
    Document   : view_payment
    Created on : 27 Apr, 2025, 11:53:51 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking List</title>
      <%@ include file="navbar.jsp" %>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #096187, #1E3C72);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 80%;
            margin-top: -180px;
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
    <h3>Payment List</h3>
    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>Payment ID</th>
                <th>Payment Type</th>
                <th>Full Name</th>
                <th>Card No</th>
                <th>UPI</th>
                <th>Payment Date</th>
                
               
                
            </tr>
        </thead>
        <tbody>

       <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/car_rental_system", "root", "root");

                String query = "SELECT * FROM payment";
                PreparedStatement ps = cn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("payment_method") %></td>
                <td><%= rs.getString("full_name") %></td>
                <td><%= rs.getString("card_number") %></td>
                <td><%= rs.getString("upi_id") %></td>
                <td><%= rs.getString("payment_date") %></td>
                 
                
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
