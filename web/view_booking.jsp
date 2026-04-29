<%-- 
    Document   : view_booking
    Created on : 28 Apr, 2025, 5:45:27 AM
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
    <h3>Booking List</h3>
    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>Booking ID</th>
                <th>Full Name</th>
                <th>Car Name</th>
                <th>Price</th>
                <th>Start Date</th>
                <th>End Date</th>
                
                <th>Total Days</th>
                <th>Total Price</th>
                <th>Booking Date</th>
                
            </tr>
        </thead>
        <tbody>

       <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/car_rental_system", "root", "root");

                String query = "SELECT * FROM bookings";
                PreparedStatement ps = cn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("booking_id") %></td>
                <td><%= rs.getString("fname") %></td>
                <td><%= rs.getString("car_name") %></td>
                <td><%= rs.getString("price_per_day") %></td>
                <td><%= rs.getString("start_date") %></td>
                <td><%= rs.getString("end_date") %></td>
                 <td><%= rs.getString("total_days") %></td>
                 <td><%= rs.getString("total_price") %></td>
                 <td><%= rs.getString("booking_date") %></td>
                
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