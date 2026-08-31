6<%-- 
    Document   : admin_login
    Created on : 27 Apr, 2025, 11:40:27 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        body {
            background-image: url(car5.jfif);
            background-size: cover;
        }
        .login-container {
            margin-top: 100px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 7px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        .form-title {
            margin-bottom: 20px;
        }
        .register-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-container">
                    <h3 class="text-center form-title">Admin Login</h3>
                    <form action="admin_login" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" name="user" id="username" placeholder="Enter username" required>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="apass" id="password" placeholder="Enter password" required>
                        </div>
                        <br>
                        <input type="submit" name="btn" value="Login" class="btn btn-info btn-block">
                    </form>
                   
                </div>
            </div>
        </div>
    </div>

</body>
</html>

