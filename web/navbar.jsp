<%-- 
    Document   : navbar
    Created on : 28 Apr, 2025, 5:40:27 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<style>
body {margin:0;}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  position: fixed;
  top: 0;
  width: 100%;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #04AA6D;
}
</style>
</head>
<body>

<ul>
  <li><a class="active" href="index.jsp">Home</a></li>
  <li><a href="add_car_brand.jsp">Add Brand</a></li>
  <li><a href="car_details.jsp">Car Details</a></li>
  <li><a href="view_user.jsp">View Users</a></li>
   <li><a href="view_booking.jsp">View Booking</a></li>
  <li><a href="view_payment.jsp">View Payment</a></li>
  <li><a href="view_feedback.jsp"> View Feedback</a></li>
  <li><a href="index.jsp"> Logout</a></li>
</ul>



</body>
</html>
