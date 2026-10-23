<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Brands - DriveEase Admin</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/admin_nav.jspf" %>

<main class="container py-5">
  <h2 class="fw-bold mb-4">Car brands</h2>
  <div class="row g-4">
    <div class="col-lg-5">
      <form action="car_brand" method="post" class="form-card">
        <h5 class="mb-3">Add / update / delete brand</h5>
        <div class="mb-3">
          <label for="BrandName" class="form-label">Brand name</label>
          <input type="text" class="form-control" id="BrandName" name="bname" placeholder="e.g. Honda" required>
        </div>
        <div class="mb-3">
          <label for="brandImage" class="form-label">Brand image</label>
          <input type="file" class="form-control" id="brandImage" name="brand_image" accept="image/*">
          <div class="form-text">Copy the image into the <code>web</code> folder first; only its file name is saved.</div>
        </div>
        <div class="mb-3">
          <label for="brandDesc" class="form-label">Description</label>
          <textarea class="form-control" id="brandDesc" name="brand_desc" rows="3"></textarea>
        </div>
        <div class="d-flex gap-2">
          <input type="submit" class="btn btn-success w-100" name="btn" value="Insert">
          <input type="submit" class="btn btn-warning w-100" name="btn" value="Update">
          <input type="submit" class="btn btn-danger w-100" name="btn" value="Delete">
        </div>
      </form>
    </div>
    <div class="col-lg-7">
      <div class="table-card table-responsive">
        <table class="table">
          <thead><tr><th>Image</th><th>Brand</th><th>Description</th></tr></thead>
          <tbody>
          <%
              try {
                  Connection cn = getConn();
                  ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM car_brand ORDER BY bname");
                  boolean any = false;
                  while (rs.next()) { any = true;
          %>
            <tr>
              <td><img src="<%= esc(rs.getString("brand_image")) %>" alt="" width="64" height="40" style="object-fit:cover;border-radius:6px"></td>
              <td class="fw-semibold"><%= esc(rs.getString("bname")) %></td>
              <td class="text-muted small"><%= esc(rs.getString("brand_desc")) %></td>
            </tr>
          <%
                  }
                  cn.close();
                  if (!any) out.println("<tr><td colspan='3' class='empty'>No brands yet.</td></tr>");
              } catch (Exception e) {
                  out.println("<tr><td colspan='3' class='text-danger'>Error: " + esc(e.getMessage()) + "</td></tr>");
              }
          %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
