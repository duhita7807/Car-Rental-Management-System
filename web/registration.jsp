<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create account - DriveEase</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/header.jspf" %>

<main class="auth">
  <div class="auth-side">
    <h2>Join DriveEase</h2>
    <p>Create a free account to book cars in seconds and keep track of your trips.</p>
  </div>
  <div class="auth-form">
    <div class="inner">
      <h3 class="fw-bold mb-1">Create your account</h3>
      <p class="text-muted mb-4">Already have one? <a href="user_login.jsp">Sign in</a></p>
      <form action="user_registration" method="post">
        <div class="mb-3">
          <label class="form-label">Full name</label>
          <input type="text" name="nm" class="form-control" placeholder="Your full name" pattern="[A-Za-z ]+" title="Letters and spaces only" required>
        </div>
        <div class="row g-3 mb-3">
          <div class="col-md-6">
            <label class="form-label">Mobile number</label>
            <input type="tel" name="cont" class="form-control" placeholder="10-digit number" pattern="[0-9]{10}" title="10 digits" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">Email</label>
            <input type="email" name="mail" class="form-control" placeholder="you@example.com" required>
          </div>
        </div>
        <div class="mb-3">
          <label class="form-label">Address</label>
          <input type="text" name="adrs" class="form-control" placeholder="City, State" required>
        </div>
        <div class="mb-3">
          <label class="form-label d-block">Gender</label>
          <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gen" value="male" id="gm" required><label class="form-check-label" for="gm">Male</label></div>
          <div class="form-check form-check-inline"><input class="form-check-input" type="radio" name="gen" value="female" id="gf"><label class="form-check-label" for="gf">Female</label></div>
        </div>
        <div class="row g-3 mb-4">
          <div class="col-md-6">
            <label class="form-label">Username</label>
            <input type="text" name="user" class="form-control" pattern="[A-Za-z0-9_]+" title="Letters, numbers and _ only" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">Password</label>
            <input type="password" name="pass" class="form-control" minlength="6" required>
          </div>
        </div>
        <input type="submit" value="SIGN UP" name="btn" class="btn btn-accent w-100">
      </form>
    </div>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
