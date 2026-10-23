<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Feedback - DriveEase</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/header.jspf" %>

<main>
<div class="page-head">
  <div class="container">
    <h1>We'd love your feedback</h1>
    <p>Tell us about your trip or ask us anything. We reply within 24 hours.</p>
  </div>
</div>

<div class="container py-5">
  <div class="row g-4 justify-content-center">
    <div class="col-lg-7">
      <form action="feedback" method="post" class="form-card">
        <div class="row g-3">
          <div class="col-md-6">
            <label for="name" class="form-label">Full name</label>
            <input type="text" class="form-control" id="name" name="name" required>
          </div>
          <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="col-12">
            <label for="message" class="form-label">Message</label>
            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
          </div>
        </div>
        <input type="submit" value="Feedback" name="btn" class="btn btn-accent w-100 mt-4">
      </form>
    </div>
    <div class="col-lg-4">
      <img src="feedback.jpeg" alt="Customer support" class="img-fluid rounded-3 mb-3">
      <div class="feature">
        <h6>Customer support</h6>
        <p>support@driveease.in<br>+91 98765 43210<br>Mon-Sun, 24 hours</p>
      </div>
    </div>
  </div>
</div>
</main>

<%@ include file="WEB-INF/includes/footer.jspf" %>
</body>
</html>
