<%-- 
    Document   : index
    Created on : 27 Apr, 2025, 10:42:50 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home - Car Rental System</title>
   
    <link href="bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
        }
        .banner {
            background-image: url('car2.jfif');
            background-size: cover;
            background-position: center;
            height: 90vh;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
        }
        .banner h1 {
            font-size: 60px;
            font-weight: bold;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.7);
        }
        .banner p {
            font-size: 24px;
            margin-top: 15px;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.6);
        }
        .btn-explore {
            margin-top: 25px;
            padding: 12px 30px;
            font-size: 18px;
            border-radius: 30px;
        }
        .section-title {
            text-align: center;
            margin-top: 60px;
            margin-bottom: 40px;
            font-weight: bold;
            font-size: 36px;
            color: #333;
        }
        .service-box, .car-box, .about-box {
            background: #fff;
            border-radius: 15px;
            padding: 25px;
            margin: 15px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s;
            text-align: center;
        }
        .service-box:hover, .car-box:hover {
            transform: translateY(-10px);
        }
        .footer {
            background-color: black;
            color: #aaa;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }
        .about-section {
            background: #fff;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin: 50px 0;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="home.jsp">CarRental</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">

        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Cars</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">About Us</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="user_login.jsp">
            <button class="btn btn-outline-warning btn-sm">User Login</button>
          </a>
            <a class="nav-link" href="admin_login.jsp">
            <button class="btn btn-outline-warning btn-sm">Admin Login</button>
          </a>
        </li>

      </ul>
    </div>
  </div>
</nav>
<!-- Banner -->
<div class="banner">
    <h1>Drive Your Dreams</h1>
    <p>Reliable, Affordable, and Stylish Cars at Your Service</p>
    <a href="car_list.jsp" class="btn btn-warning btn-explore">Explore Our Cars</a>
</div>

<!-- Services -->
<div class="container">
    <h2 class="section-title">Our Services</h2>
    <div class="row text-center">
        <div class="col-md-4">
            <div class="service-box">
                <img src="car3.jfif" width="70" alt="Easy Booking">
                <h4>Easy Booking</h4>
                <p>Book your favorite car in just a few clicks from anywhere.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-box">
                <img src="car4.jfif" width="70" alt="Affordable Prices">
                <h4>Affordable Prices</h4>
                <p>Competitive rates without compromising on quality or service.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="service-box">
                <img src="car5.jfif" width="70" alt="24/7 Support">
                <h4>24/7 Support</h4>
                <p>Our team is always available to assist you, day or night.</p>
            </div>
        </div>
    </div>
</div>

<!-- About Us -->
<div class="container">
    <h2 class="section-title">About Us</h2>
    <div class="about-section">
        <div class="row">
            <div class="col-md-6">
                <img src="car1.jfif" alt="About Car Rental" class="img-fluid rounded">
            </div>
            <div class="col-md-6 d-flex align-items-center">
                <div class="about-box">
                    <h4>Who We Are</h4>
                    <p>We are a trusted car rental company offering the best vehicles at unbeatable prices. Whether you need a car for a business trip, vacation, or daily use, we have the right car for you. Enjoy seamless booking, well-maintained vehicles, and excellent customer service with us!</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Popular Cars -->
<div class="container">
    <h2 class="section-title">Popular Cars</h2>
    <div class="row text-center">
        <div class="col-md-3">
            <div class="car-box">
                <img src="car2.jfif" width="100%" class="rounded" alt="Honda City">
                <h5 class="mt-3">Honda City</h5>
                <p>₹1500/day</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="car-box">
                <img src="car7.jfif" width="100%" class="rounded" alt="Hyundai Creta">
                <h5 class="mt-3">Hyundai Creta</h5>
                <p>₹1800/day</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="car-box">
                <img src="car8.jfif" width="100%" class="rounded" alt="Maruti Swift">
                <h5 class="mt-3">Maruti Swift</h5>
                <p>₹1200/day</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="car-box">
                <img src="car9.jfif" width="100%" class="rounded" alt="Toyota Fortuner">
                <h5 class="mt-3">Toyota Fortuner</h5>
                <p>₹3500/day</p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>© 2025 Car Rental System. Designed with ❤️ by Your Team.</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
