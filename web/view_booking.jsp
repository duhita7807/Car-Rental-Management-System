<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bookings - DriveEase Admin</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/admin_nav.jspf" %>

<main class="container py-5">
  <h2 class="fw-bold mb-4">Bookings</h2>
  <div class="table-card table-responsive">
    <table class="table table-hover">
      <thead><tr><th>ID</th><th>Customer</th><th>Car</th><th>Rate / day</th><th>From</th><th>To</th><th>Days</th><th>Total</th><th>Booked on</th></tr></thead>
      <tbody>
      <%
          try {
              Connection cn = getConn();
              ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM bookings ORDER BY booking_id DESC");
              boolean any = false;
              while (rs.next()) { any = true;
      %>
        <tr>
          <td><%= esc(rs.getString("booking_id")) %></td>
          <td><%= esc(rs.getString("fname")) %></td>
          <td><%= esc(rs.getString("car_name")) %></td>
          <td><%= esc(rs.getString("price_per_day")) %></td>
          <td><%= esc(rs.getString("start_date")) %></td>
          <td><%= esc(rs.getString("end_date")) %></td>
          <td><%= esc(rs.getString("total_days")) %></td>
          <td><%= esc(rs.getString("total_price")) %></td>
          <td><%= esc(rs.getString("booking_date")) %></td>
        </tr>
      <%
              }
              cn.close();
              if (!any) out.println("<tr><td colspan='9' class='empty'>Nothing here yet.</td></tr>");
          } catch (Exception e) {
              out.println("<tr><td colspan='9' class='text-danger'>Error: " + esc(e.getMessage()) + "</td></tr>");
          }
      %>
      </tbody>
    </table>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
