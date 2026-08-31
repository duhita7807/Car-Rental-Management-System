<%-- 
    Document   : feedback
    Created on : 27 Apr, 2025, 11:35:22 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Feedback</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        body {
            background-image: url(trip2.jpg) ;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 40%;
            margin-left: 750px;
        }
        h3 {
            text-align: center;
            color: #096187;
        }
    </style>
</head>
<body>
<br><br>
<div class="container">
    <h3>Submit Your Feedback</h3>
    <form action="feedback" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="message" class="form-label">Feedback</label>
            <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
        </div><br>
        <input type="submit" value="Feedback" name="btn" class="btn btn-primary">
    </form>
</div>

</body>
</html>
