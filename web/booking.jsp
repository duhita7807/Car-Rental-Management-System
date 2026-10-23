<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<%
    String carName = request.getParameter("car_name");
    String pricePerDay = request.getParameter("rate_per_day");
    if (carName == null) { response.sendRedirect("view_car.jsp"); return; }
    Object user = session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Book <%= esc(carName) %> - DriveEase</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/header.jspf" %>

<main>
<div class="page-head">
  <div class="container">
    <h1>Book your car</h1>
    <p>Choose your dates. The total updates as you go.</p>
  </div>
</div>

<div class="container py-5">
  <form action="booking" method="post" class="row g-4">
    <div class="col-lg-7">
      <div class="form-card">
        <h5 class="mb-4">Trip details</h5>
        <div class="mb-3">
          <label class="form-label">Full name</label>
          <input type="text" name="fname" class="form-control" placeholder="As on your driving licence"
                 value="<%= user == null ? "" : esc(user) %>" required>
        </div>
        <div class="row g-3 mb-3">
          <div class="col-md-6">
            <label class="form-label">Car</label>
            <input type="text" name="carName" class="form-control" value="<%= esc(carName) %>" readonly>
          </div>
          <div class="col-md-6">
            <label class="form-label">Price per day (&#8377;)</label>
            <input type="number" name="price" id="price" class="form-control" value="<%= esc(pricePerDay) %>" readonly>
          </div>
        </div>
        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">Pick-up date</label>
            <input type="date" id="startDate" name="startDate" class="form-control" onchange="cal()" required>
          </div>
          <div class="col-md-6">
            <label class="form-label">Return date</label>
            <input type="date" id="endDate" name="endDate" class="form-control" onchange="cal()" required>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-5">
      <div class="summary">
        <h5 class="mb-3"><%= esc(carName) %></h5>
        <div class="row-line"><span>Rate per day</span><span>&#8377;<%= esc(pricePerDay) %></span></div>
        <div class="row-line"><span>Number of days</span>
          <input type="number" id="totalDays" name="totalDays" class="bg-transparent border-0 text-end text-light p-0" style="width:80px" value="0" readonly>
        </div>
        <div class="row-line"><span>Insurance &amp; taxes</span><span>Included</span></div>
        <div class="total"><span>Total</span>
          <span>&#8377;<input type="number" id="tp" name="totalpr" class="bg-transparent border-0 text-end fw-bold p-0" style="width:120px;color:var(--accent)" value="0" readonly></span>
        </div>
        <input type="submit" name="Book" value="Confirm Booking" class="btn btn-accent w-100 mt-4" id="bookBtn" disabled>
        <p class="small text-secondary mt-3 mb-0">Free cancellation up to 24 hours before pick-up.</p>
      </div>
    </div>
  </form>
</div>
</main>

<%@ include file="WEB-INF/includes/footer.jspf" %>
<script>
    var today = new Date().toISOString().split('T')[0];
    document.getElementById('startDate').min = today;
    document.getElementById('endDate').min = today;

    function cal() {
        var s = document.getElementById('startDate').value;
        var e = document.getElementById('endDate').value;
        if (s) document.getElementById('endDate').min = s;
        var ok = s && e && e >= s;
        // Same-day return counts as one day
        var days = ok ? Math.max(1, Math.round((new Date(e) - new Date(s)) / 86400000)) : 0;
        document.getElementById('totalDays').value = days;
        document.getElementById('tp').value = days * Number(document.getElementById('price').value);
        document.getElementById('bookBtn').disabled = !ok;
    }
</script>
</body>
</html>
