<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cars - DriveEase Admin</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/admin_nav.jspf" %>

<main class="container py-5">
  <h2 class="fw-bold mb-4">Fleet</h2>

  <form action="car_details" method="post" class="form-card mb-4">
    <h5 class="mb-3">Add / update / delete car</h5>
    <div class="row g-3">
      <div class="col-md-4">
        <label class="form-label">Car name</label>
        <input type="text" class="form-control" name="cname" placeholder="Honda City" required>
      </div>
      <div class="col-md-4">
        <label class="form-label">Brand</label>
        <select class="form-select" name="cbrand">
          <option value="">Choose brand</option>
          <%
              try {
                  Connection cn = getConn();
                  ResultSet rs = cn.createStatement().executeQuery("SELECT bname FROM car_brand ORDER BY bname");
                  while (rs.next()) {
                      out.println("<option>" + esc(rs.getString("bname")) + "</option>");
                  }
                  cn.close();
              } catch (Exception e) {
                  e.printStackTrace();
              }
          %>
        </select>
      </div>
      <div class="col-md-2">
        <label class="form-label">Seats</label>
        <input type="number" class="form-control" name="capacity" placeholder="5" min="2" max="12">
      </div>
      <div class="col-md-2">
        <label class="form-label">Rate / day (&#8377;)</label>
        <input type="number" class="form-control" name="rate" placeholder="1500" min="0">
      </div>
      <div class="col-md-2">
        <label class="form-label">Mileage (km/l)</label>
        <input type="text" class="form-control" name="mileage" placeholder="18">
      </div>
      <div class="col-md-5">
        <label class="form-label">Image 1</label>
        <input type="file" name="img1" class="form-control" accept="image/*">
      </div>
      <div class="col-md-5">
        <label class="form-label">Image 2</label>
        <input type="file" name="img2" class="form-control" accept="image/*">
      </div>
      <div class="col-12">
        <label class="form-label">Description</label>
        <textarea class="form-control" rows="2" name="cdesc" placeholder="Stylish sedan with high performance..."></textarea>
        <div class="form-text">Copy images into the <code>web</code> folder first; only their file names are saved.</div>
      </div>
    </div>
    <div class="d-flex gap-2 mt-4">
      <input type="submit" class="btn btn-success w-100" name="btn" value="Insert">
      <input type="submit" class="btn btn-warning w-100" name="btn" value="Update">
      <input type="submit" class="btn btn-danger w-100" name="btn" value="Delete">
    </div>
  </form>

  <div class="table-card table-responsive">
    <table class="table">
      <thead><tr><th>Image</th><th>Car</th><th>Brand</th><th>Seats</th><th>Mileage</th><th>Rate / day</th></tr></thead>
      <tbody>
      <%
          try {
              Connection cn = getConn();
              ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM car_details ORDER BY car_brand, car_name");
              boolean any = false;
              while (rs.next()) { any = true;
      %>
        <tr>
          <td><img src="<%= esc(rs.getString("image1")) %>" alt="" width="72" height="44" style="object-fit:cover;border-radius:6px"></td>
          <td class="fw-semibold"><%= esc(rs.getString("car_name")) %></td>
          <td><%= esc(rs.getString("car_brand")) %></td>
          <td><%= rs.getInt("seating_capacity") %></td>
          <td><%= esc(rs.getString("mileage")) %> km/l</td>
          <td>&#8377;<%= rs.getInt("rate_per_day") %></td>
        </tr>
      <%
              }
              cn.close();
              if (!any) out.println("<tr><td colspan='6' class='empty'>No cars yet.</td></tr>");
          } catch (Exception e) {
              out.println("<tr><td colspan='6' class='text-danger'>Error: " + esc(e.getMessage()) + "</td></tr>");
          }
      %>
      </tbody>
    </table>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
