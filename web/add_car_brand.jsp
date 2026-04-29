<%-- 
    Document   : add_car_brand
    Created on : 27 Apr, 2025, 10:48:08 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Car Brand</title>
   <%@ include file="navbar.jsp" %>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        body {
            background-image: url('car1.jfif');
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .header-container {
            background-color: black;
            width: 40%;
            padding: 15px 0;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .header-container h2 {
            color: white;
            margin: 0;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            width: 40%;
        }

        h3, label {
            color: black;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }
    </style>
</head>
<body>

<div class="header-container">
    <h2>Car Brand Details</h2>
</div>

<div class="form-container">
   
    <form action="car_brand" method="post" >
        <div class="mb-3">
            <label for="BrandName" class="form-label">Brand Name</label>
            <input type="text" class="form-control" id="BrandName" name="bname" placeholder="Enter Brand Name" required>
        </div>

        <div class="mb-3">
            <label for="brandImage" class="form-label">Brand Image</label>
            <input type="file" class="form-control" id="brandImage" name="brand_image" accept="image/*" required>
        </div>

        <div class="mb-3">
            <label for="brandDesc" class="form-label">Brand Description</label>
            <textarea class="form-control" id="brandDesc" name="brand_desc" placeholder="Enter Brand Description" rows="4" required></textarea>
        </div>

        <div class="btn-group">
            <input type="submit" class="btn btn-success w-100" name="btn" value="Insert">
            <input type="submit" class="btn btn-warning w-100" name="btn" value="Update">
            <input type="submit" class="btn btn-danger w-100" name="btn" value="Delete">
        </div>
    </form>
</div>

</body>
</html>

