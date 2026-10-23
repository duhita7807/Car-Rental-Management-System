<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Feedback - DriveEase Admin</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/admin_nav.jspf" %>

<main class="container py-5">
  <h2 class="fw-bold mb-4">Feedback</h2>
  <div class="table-card table-responsive">
    <table class="table table-hover">
      <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Message</th><th>Received</th></tr></thead>
      <tbody>
      <%
          try {
              Connection cn = getConn();
              ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM feedback ORDER BY id DESC");
              boolean any = false;
              while (rs.next()) { any = true;
      %>
        <tr>
          <td><%= esc(rs.getString("id")) %></td>
          <td><%= esc(rs.getString("fname")) %></td>
          <td><%= esc(rs.getString("email")) %></td>
          <td><%= esc(rs.getString("message")) %></td>
          <td><%= esc(rs.getString("submitted_at")) %></td>
        </tr>
      <%
              }
              cn.close();
              if (!any) out.println("<tr><td colspan='5' class='empty'>Nothing here yet.</td></tr>");
          } catch (Exception e) {
              out.println("<tr><td colspan='5' class='text-danger'>Error: " + esc(e.getMessage()) + "</td></tr>");
          }
      %>
      </tbody>
    </table>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
