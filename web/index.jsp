<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>DriveEase - Self-Drive Car Rental</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/header.jspf" %>

<main>
<section class="hero">
  <div class="container">
    <span class="eyebrow">Self-drive rentals across Maharashtra</span>
    <h1 class="mt-3">Rent the right car,<br><span>drive on your terms.</span></h1>
    <p class="lead mt-3">Hatchbacks, sedans and SUVs from trusted brands. Transparent daily pricing, no hidden charges, unlimited kilometres.</p>
    <div class="d-flex gap-3 mt-4 flex-wrap">
      <a href="view_car.jsp" class="btn btn-accent btn-lg">Browse cars</a>
      <a href="view_brands.jsp" class="btn btn-ghost btn-lg">View brands</a>
    </div>
  </div>
</section>

<div class="container">
  <form class="search-card row g-3 align-items-end" action="view_car.jsp" method="get">
    <div class="col-md-5">
      <label class="form-label">Which car are you looking for?</label>
      <input type="text" name="search_car" class="form-control" placeholder="e.g. Creta, Swift, Fortuner">
    </div>
    <div class="col-md-5">
      <label class="form-label">Brand</label>
      <select name="brand_name" class="form-select">
        <option value="">All brands</option>
        <%
            try {
                Connection cn = getConn();
                ResultSet rs = cn.createStatement().executeQuery("SELECT bname FROM car_brand ORDER BY bname");
                while (rs.next()) {
        %>
        <option><%= esc(rs.getString("bname")) %></option>
        <%
                }
                cn.close();
            } catch (Exception e) { /* brand list is optional; search still works */ }
        %>
      </select>
    </div>
    <div class="col-md-2 d-grid">
      <button class="btn btn-accent">Search</button>
    </div>
  </form>
</div>

<section class="section">
  <div class="container">
    <div class="text-center">
      <h2 class="section-title">Popular cars</h2>
      <p class="section-sub">Our most booked cars this month, serviced and sanitised before every trip.</p>
    </div>
    <div class="row g-4">
      <%
          try {
              Connection cn = getConn();
              ResultSet rs = cn.createStatement().executeQuery("SELECT * FROM car_details ORDER BY car_id LIMIT 4");
              boolean any = false;
              while (rs.next()) { any = true;
      %>
      <div class="col-sm-6 col-lg-3">
        <div class="car-card">
          <img src="<%= esc(rs.getString("image1")) %>" alt="<%= esc(rs.getString("car_name")) %>">
          <div class="body">
            <span class="muted"><%= esc(rs.getString("car_brand")) %></span>
            <h5><%= esc(rs.getString("car_name")) %></h5>
            <div class="specs">
              <span class="spec"><%= rs.getInt("seating_capacity") %> seats</span>
              <span class="spec"><%= esc(rs.getString("mileage")) %> km/l</span>
            </div>
            <div class="d-flex justify-content-between align-items-center mt-auto">
              <div class="price">&#8377;<%= rs.getInt("rate_per_day") %> <small>/day</small></div>
              <form action="booking.jsp" method="post" class="m-0">
                <input type="hidden" name="car_name" value="<%= esc(rs.getString("car_name")) %>">
                <input type="hidden" name="rate_per_day" value="<%= rs.getInt("rate_per_day") %>">
                <button class="btn btn-accent btn-sm">Book</button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <%
              }
              cn.close();
              if (!any) out.println("<p class='text-center text-muted'>No cars added yet.</p>");
          } catch (Exception e) {
              out.println("<p class='text-center text-danger'>Could not load cars: " + esc(e.getMessage()) + "</p>");
          }
      %>
    </div>
    <div class="text-center mt-4"><a href="view_car.jsp" class="fw-semibold">See all cars &rarr;</a></div>
  </div>
</section>

<section class="stats">
  <div class="container">
    <div class="row text-center g-4">
      <div class="col-6 col-md-3"><h3>500+</h3><p>Happy customers</p></div>
      <div class="col-6 col-md-3"><h3>50+</h3><p>Cars in fleet</p></div>
      <div class="col-6 col-md-3"><h3>4.8&#9733;</h3><p>Average rating</p></div>
      <div class="col-6 col-md-3"><h3>24/7</h3><p>Roadside support</p></div>
    </div>
  </div>
</section>

<section class="section">
  <div class="container">
    <div class="text-center">
      <h2 class="section-title">Why rent with us</h2>
      <p class="section-sub">Everything you need for a stress-free trip, included in the price.</p>
    </div>
    <div class="row g-4">
      <div class="col-md-4"><div class="feature"><div class="icon">&#128179;</div><h5>Transparent pricing</h5><p>One daily rate with insurance and taxes included. What you see is what you pay.</p></div></div>
      <div class="col-md-4"><div class="feature"><div class="icon">&#128663;</div><h5>Well-maintained fleet</h5><p>Every car is inspected, serviced and cleaned before it reaches you.</p></div></div>
      <div class="col-md-4"><div class="feature"><div class="icon">&#128222;</div><h5>24/7 support</h5><p>Breakdown or flat tyre? Our team is one call away, day or night.</p></div></div>
    </div>
  </div>
</section>

<section class="section bg-white" id="how">
  <div class="container">
    <div class="text-center">
      <h2 class="section-title">How it works</h2>
      <p class="section-sub">Get on the road in three simple steps.</p>
    </div>
    <div class="row g-4 text-center">
      <div class="col-md-4"><div class="step-num">1</div><h5>Choose a car</h5><p class="text-muted">Browse by brand, seats and price to find the right fit.</p></div>
      <div class="col-md-4"><div class="step-num">2</div><h5>Pick your dates</h5><p class="text-muted">Select pick-up and return dates and see the total instantly.</p></div>
      <div class="col-md-4"><div class="step-num">3</div><h5>Pay &amp; drive</h5><p class="text-muted">Pay securely by card or UPI and collect your keys.</p></div>
    </div>
  </div>
</section>
</main>

<%@ include file="WEB-INF/includes/footer.jspf" %>
</body>
</html>
