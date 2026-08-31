<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  
  <title>Add Car Details</title>
 <%@ include file="navbar.jsp" %>
<link href="bootstrap.min.css" rel="stylesheet">
<style>
    body {
      background-color: skyblue;
    }
    .car-form {
      max-width: 800px;
      padding: 30px;
      background-color: white;
      border-bottom-left-radius: 10px;
      border-bottom-right-radius: 10px;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    .action-buttons {
      display: flex;
      justify-content: center;
      gap: 15px;
    }
    .action-buttons button {
      width: 150px;
    }
    .spacer {
      margin-top: 30px;
    }
    .btn-group {
      display: flex;
      justify-content: space-between;
      gap: 10px;
    }
    .header-container {
      background-color: black;
      width: 59.3%;
      padding: 15px 0;
      text-align: center;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      margin-left: 276px;
      margin-top: 60px;
    }
    .header-container h2 {
      color: white;
      margin: 0;
    }
</style>
</head>
<body>

<div class="header-container">
    <h2>Add Car Details</h2>
</div>

<form action="car_details" method="post" >
<div class="spacer"></div>

<div class="container car-form" style="margin-top:-29px">
    
    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Car Name</label>
        <input type="text" class="form-control" name="cname" placeholder="Honda City">
      </div>
      <div class="col">
        <label class="form-label">Car Brand</label>
        <select class="form-control" name="cbrand">
            <option value="">Choose Car Brand</option>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/car_rental_system", "root", "root");
                    Statement st = cn.createStatement();
                    ResultSet rs = st.executeQuery("SELECT bname FROM car_brand");
                    while (rs.next()) {
                        String brandName = rs.getString("bname");
                        out.println("<option value='" + brandName + "'>" + brandName + "</option>");
                    }
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Seating Capacity</label>
        <input type="number" class="form-control" name="capacity" placeholder="5">
      </div>
      <div class="col">
        <label class="form-label">Rate per Day</label>
        <input type="text" class="form-control" name="rate" placeholder="1500">
      </div>
    </div>

    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Mileage (km/l)</label>
        <input type="text" class="form-control" name="mileage" placeholder="18">
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Upload Image 1</label>
      <input type="file" name="img1" class="form-control">
    </div>

    <div class="mb-3">
      <label class="form-label">Upload Image 2</label>
      <input type="file" name="img2" class="form-control">
    </div>

    <div class="mb-3">
      <label class="form-label">Car Description</label>
      <textarea class="form-control" rows="3" name="cdesc" placeholder="Stylish sedan with high performance..."></textarea>
    </div>

    <div class="btn-group">
        <input type="submit" class="btn btn-success w-100" name="btn" value="Insert">
        <input type="submit" class="btn btn-warning w-100" name="btn" value="Update">
        <input type="submit" class="btn btn-danger w-100" name="btn" value="Delete">
    </div>

</div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
