<%-- 
    Document   : trip_manage
    Created on : 24 Apr, 2025, 3:06:57 PM
    Author     : pc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add New Trip</title>
   <%@ include file="navbar.jsp" %>
<link href="bootstrap.min.css" rel="stylesheet">  <style>
    body {
      background-color: skyblue;
    }
    .trip-form {
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
    <h2>Add Trip Here</h2>
</div>
    <form action="trip_manage" method="post">


<div class="spacer"></div>

<div class="container trip-form" style="margin-top:-29px">
 
  <form>
    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Trip Title</label>
        <input type="text" class="form-control" name="ttrip" placeholder="Goa Beach Getaway">
      </div>
      <div class="col">
        <label class="form-label">Destination</label>
        <input type="text" class="form-control" name="desti" placeholder="Goa">
      </div>
    </div>

    <div class="row mb-3">
      <div class="col">
        <label class="form-label">Start Date</label>
        <input type="date" class="form-control" name="sdate" id="startDate">
      </div>
      <div class="col">
        <label class="form-label">End Date</label>
        <input type="date" class="form-control" name="edate" id="endDate">
      </div>
      <div class="col">
        <label class="form-label">Duration (in Days)</label>
        <input type="text" class="form-control" name="days" id="duration" readonly>
      </div>
    </div>

   
                <div class="row mb-3">
      <div class="col">
        <label class="form-label">Price per Person</label>
        <input type="number" class="form-control" name="price" placeholder="Enter Price">
      </div>
     <div class="col">
    <label for="TripType" class="form-label">Trip Type</label>
    <select class="form-control" name="ttype" id="category">
        <option value="">Choose Trip Type</option>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_planner", "root", "root");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("SELECT trip_name FROM trip_type");
                while (rs.next()) {
                    String tripName = rs.getString("trip_name");
                    out.println("<option value='" + tripName + "'>" + tripName + "</option>");
                }
                cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </select>
</div>

    </div>

    <div class="mb-3">
      <label class="form-label">Itinerary</label>
      <textarea class="form-control" rows="3" name="itri" placeholder="Day 1: Arrival..."></textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">Trip Description</label>
      <textarea class="form-control" rows="2" name="descr" placeholder="A fun beach vacation..."></textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">Upload Images</label>
      <input type="file" name="img" class="form-control" multiple>
    </div>

    <div class="mb-3">
      <label class="form-label">Status</label>
      <select class="form-select" name="status">
        <option value="Active">Active</option>
        <option value="Inactive">Inactive</option>
      </select>
    </div>
<div class="btn-group">
            <input type="submit" class="btn btn-success w-100" name="btn" value="Insert">
            <input type="submit" class="btn btn-warning w-100" name="btn" value="Update">
            <input type="submit" class="btn btn-danger w-100" name="btn" value="Delete">
        </div>
    
  </form>
</div>

<script>
  const startInput = document.getElementById("startDate");
  const endInput = document.getElementById("endDate");
  const durationField = document.getElementById("duration");

  function calculateDuration() {
    const startDateStr = startInput.value;
    const endDateStr = endInput.value;

    if (startDateStr && endDateStr) {
      const startDate = new Date(startDateStr);
      const endDate = new Date(endDateStr);

      if (!isNaN(startDate.getTime()) && !isNaN(endDate.getTime()) && endDate >= startDate) {
        const diffTime = endDate - startDate;
        const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24)) + 1;
        const nights = diffDays - 1;
        durationField.value = diffDays + " Days " + nights + " Nights";
      } else {
        durationField.value = "";
      }
    } else {
      durationField.value = "";
    }
  }

  startInput.addEventListener("input", calculateDuration);
  endInput.addEventListener("input", calculateDuration);
</script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </form>
</body>
</html>
