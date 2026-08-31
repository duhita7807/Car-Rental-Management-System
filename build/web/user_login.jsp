<%-- 
    Document   : user_login
    Created on : 27 Apr, 2025, 10:46:01 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        body {
            background-image: url(car3.jfif);
            background-size: cover;
        }
        .login-container {
            margin-top: 00px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 7px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
        }
        .form-title {
            margin-bottom: 20px;
        }
        .register-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }
        .header-container {
            background-color: black;
            width: 40%;
            padding: 15px 0;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            margin-left: 410px;
           margin-top: 50px;
            
        }
         .header-container h2 {
            color: white;
            margin: 0;
        }
    </style>
</head>
<body>
<div class="header-container">
    <h2>Login Here</h2>
</div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="login-container">
                    
                    <form action="user_login" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" name="user" id="username" placeholder="Enter username" required>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="upass" id="password" placeholder="Enter password" required>
                        </div>
                        <br>
                        <input type="submit" name="btn" value="Login" class="btn btn-info btn-block">
                    </form>
                    <a href="registration.jsp" class="register-link">Create New Account?</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

