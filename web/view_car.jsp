<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<%
    String searchCar = request.getParameter("search_car");
    String brandName = request.getParameter("brand_name");
    if (searchCar == null) searchCar = "";
    if (brandName == null) brandName = "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cars - DriveEase</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/header.jspf" %>

<main>
<div class="page-head">
  <div class="container">
    <h1><%= brandName.isEmpty() ? "All cars" : esc(brandName) + " cars" %></h1>
    <p>Daily rates include insurance and unlimited kilometres.</p>
  </div>
</div>

<div class="container py-5">
  <form method="get" action="view_car.jsp" class="row g-2 mb-4">
    <input type="hidden" name="brand_name" value="<%= esc(brandName) %>">
    <div class="col-md-10">
      <input type="text" name="search_car" class="form-control" placeholder="Search by car name..." value="<%= esc(searchCar) %>">
    </div>
    <div class="col-md-2 d-grid"><button class="btn btn-accent">Search</button></div>
  </form>

  <div class="row g-4">
  <%
      try {
          Connection cn = getConn();
          PreparedStatement ps = cn.prepareStatement(
               "SELECT * FROM car_details WHERE car_name LIKE ? AND (? = '' OR car_brand = ?) ORDER BY rate_per_day");
          ps.setString(1, "%" + searchCar + "%");
          ps.setString(2, brandName);
          ps.setString(3, brandName);
          ResultSet rs = ps.executeQuery();
          boolean any = false;
          while (rs.next()) { any = true;
  %>
    <div class="col-md-6 col-lg-4">
      <div class="car-card">
        <img src="<%= esc(rs.getString("image1")) %>" alt="<%= esc(rs.getString("car_name")) %>">
        <div class="body">
          <div class="d-flex justify-content-between">
            <span class="muted"><%= esc(rs.getString("car_brand")) %></span>
            <span class="badge bg-success align-self-start">Available</span>
          </div>
          <h5><%= esc(rs.getString("car_name")) %></h5>
          <p class="muted mb-0"><%= esc(rs.getString("car_description")) %></p>
          <div class="specs">
            <span class="spec"><%= rs.getInt("seating_capacity") %> seats</span>
            <span class="spec"><%= esc(rs.getString("mileage")) %> km/l</span>
            <span class="spec">Insurance incl.</span>
          </div>
          <div class="d-flex justify-content-between align-items-center mt-auto">
            <div class="price">&#8377;<%= rs.getInt("rate_per_day") %> <small>/day</small></div>
            <form action="booking.jsp" method="post" class="m-0">
              <input type="hidden" name="car_name" value="<%= esc(rs.getString("car_name")) %>">
              <input type="hidden" name="rate_per_day" value="<%= rs.getInt("rate_per_day") %>">
              <button class="btn btn-accent">Book now</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  <%
          }
          cn.close();
          if (!any) out.println("<p class='text-muted text-center'>No cars match your search.</p>");
      } catch (Exception e) {
          out.println("<p class='text-danger text-center'>Error: " + esc(e.getMessage()) + "</p>");
      }
  %>
  </div>
</div>
</main>

<%@ include file="WEB-INF/includes/footer.jspf" %>
</body>
</html>
