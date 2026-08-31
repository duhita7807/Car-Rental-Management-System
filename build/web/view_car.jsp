<%-- 
    Document   : view_car
    Created on : 28 Apr, 2025, 5:39:03 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Explore Cars</title>
  <link href="bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f9f9f9;
      font-family: 'Poppins', sans-serif;
    }
    .container {
      margin-top: 40px;
      max-width: 1100px;
    }
    .car-card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.1);
      overflow: hidden;
      margin-bottom: 30px;
      padding: 20px;
    }
    .car-row {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }
    .car-info {
      flex: 1;
      min-width: 300px;
    }
    .car-images {
      flex: 1;
      min-width: 300px;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }
    .car-title {
      font-size: 1.8rem;
      color: #0077b6;
      font-weight: bold;
      margin-bottom: 15px;
    }
    .info-item {
      font-size: 1rem;
      margin-bottom: 10px;
      color: #555;
    }
    .car-img {
      width: 100%;
      height: 150px;
      object-fit: cover;
      border-radius: 10px;
    }
    .bottom-section {
      margin-top: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
    }
    .badge {
      font-size: 0.85rem;
      padding: 10px 15px;
    }
    .book-btn {
      border-radius: 25px;
      margin-top: 10px;
    }
  </style>
</head>

<body>

<div class="container">
  <h2 class="text-center text-primary mb-5">Explore Our Cars</h2>

  <!-- Search Box -->
  <form method="get" action="view_car.jsp" class="mb-4">
    <div class="input-group">
      <input type="text" name="search_car" class="form-control" placeholder="Search by car name..." value="<%= request.getParameter("search_car") != null ? request.getParameter("search_car") : "" %>">
      <button class="btn btn-primary" type="submit">Search</button>
    </div>
  </form>

<%
    String searchCar = request.getParameter("search_car");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/car_rental_system", "root", "root");
        
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM car_details";
        
        if (searchCar != null && !searchCar.isEmpty()) {
            sql += " WHERE cname LIKE '%" + searchCar + "%'";
        }

        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
%>
  <div class="car-card">
  
    <div class="car-row">
      <div class="car-info">
        <h5 class="car-title"><%= rs.getString("car_name") %></h5>
        <div class="info-item"><strong>Brand:</strong> <%= rs.getString("car_brand") %></div>
        <div class="info-item"><strong>Seating Capacity:</strong> <%= rs.getInt("seating_capacity") %> persons</div>
        <div class="info-item"><strong>Rate per Day:</strong> ₹<%= rs.getDouble("rate_per_day") %></div>
        <div class="info-item"><strong>Mileage:</strong> <%= rs.getString("mileage") %> km/l</div>
      </div>

      <div class="car-images">
        <img src="<%= rs.getString("image1") %>" alt="Car Image 1" class="car-img">
        <img src="<%= rs.getString("image2") %>" alt="Car Image 2" class="car-img">
      </div>
    </div>

    <div class="bottom-section">
      <span class="badge bg-success">Available</span>

      <form action="booking.jsp" method="post">
        <input type="hidden" name="car_name" value="<%= rs.getString("car_name") %>">
        <input type="hidden" name="rate_per_day" value="<%= rs.getDouble("rate_per_day") %>">
        <button type="submit" class="btn btn-success book-btn">Book Now</button>
      </form>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

