<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin sign in - DriveEase</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/header.jspf" %>

<main class="auth">
  <div class="auth-side">
    <h2>Admin console</h2>
    <p>Manage brands, cars, bookings, payments and customer feedback.</p>
  </div>
  <div class="auth-form">
    <div class="inner">
      <h3 class="fw-bold mb-1">Admin sign in</h3>
      <p class="text-muted mb-4">Staff access only.</p>
      <form action="admin_login" method="post">
        <div class="mb-3">
          <label for="username" class="form-label">Username</label>
          <input type="text" class="form-control" name="user" id="username" required>
        </div>
        <div class="mb-4">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" name="apass" id="password" required>
        </div>
        <input type="submit" name="btn" value="Login" class="btn btn-accent w-100">
      </form>
    </div>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
