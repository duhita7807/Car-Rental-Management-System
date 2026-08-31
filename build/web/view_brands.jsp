<%-- 
    Document   : view_brands
    Created on : 27 Apr, 2025, 11:08:18 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Car Brands</title>
 
    <link href="bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url(car8.jfif);
            font-family: 'Segoe UI', sans-serif;
            padding-top: 50px;
            background-size: cover;
        }

        .container {
            max-width: 1200px;
        }

        .car-card {
            border-radius: 15px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 30px;
            background-color: #fff;
        }

        .car-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .car-body {
            padding: 20px;
        }

        .car-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #0288d1;
        }

        .car-desc {
            font-size: 1rem;
            color: #555;
            margin-top: 10px;
        }

        h2 {
            text-align: center;
            color: #01579b;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 style="color: black"><center>Available Car Brands</center></h1><br>
    <div class="row">
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/car_rental_system", "root", "root");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM car_brand");

                while (rs.next()) {
        %>
        <div class="col-md-4">
            <div class="car-card">
                <img src="<%= rs.getString("brand_image") %>" alt="Car Brand Image" class="car-image">
                <div class="car-body">
                    <form action="view_car.jsp" method="post">
                        <div class="car-title"><%= rs.getString("bname") %></div>
                        <input type="hidden" name="brand_name" value="<%= rs.getString("bname") %>">
                        <div class="car-desc"><%= rs.getString("brand_desc") %></div><br>
                        <input type="submit" name="btn_submit" value="View Cars" class="btn btn-primary">
                    </form>
                </div>
            </div>
        </div>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<p class='text-danger text-center'>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>