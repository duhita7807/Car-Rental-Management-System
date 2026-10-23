<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Car Brands - DriveEase</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/header.jspf" %>

<main>
<div class="page-head">
  <div class="container">
    <h1>Choose a brand</h1>
    <p>Pick a manufacturer to see every car we have from them.</p>
  </div>
</div>

<div class="container py-5">
  <div class="row g-4">
    <%
        try {
            Connection cn = getConn();
            ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM car_brand ORDER BY bname");
            boolean any = false;
            while (rs.next()) { any = true;
    %>
    <div class="col-sm-6 col-lg-4">
      <div class="car-card">
        <img src="<%= esc(rs.getString("brand_image")) %>" alt="<%= esc(rs.getString("bname")) %>">
        <div class="body">
          <h5><%= esc(rs.getString("bname")) %></h5>
          <p class="muted"><%= esc(rs.getString("brand_desc")) %></p>
          <form action="view_car.jsp" method="get" class="mt-auto">
            <input type="hidden" name="brand_name" value="<%= esc(rs.getString("bname")) %>">
            <button class="btn btn-accent w-100">View cars</button>
          </form>
        </div>
      </div>
    </div>
    <%
            }
            cn.close();
            if (!any) out.println("<p class='text-muted text-center'>No brands added yet.</p>");
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
