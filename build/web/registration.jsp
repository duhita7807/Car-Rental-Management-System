<%-- 
    Document   : registration
    Created on : 27 Apr, 2025, 10:43:01 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Signup Page</title>
    <link rel="stylesheet" href="bootstrap.css">
    <script src="validation.js"></script>
    <style>
        body {
            background-color: lightblue;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #ffffff;
            margin: 50px auto;
            padding: 30px;
            width: 50%;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        h1 {
            text-align: center;
            color: #444;
        }
        label {
            font-weight: bold;
            color: #555;
        }
        input[type=text], input[type=password], input[type=number], input[type=email], input[type=username] {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f4f4f4;
            color: #333;
        }
        input[type=radio] {
            margin-right: 5px;
        }
        input[type=submit] {
            background-color: #5c85d6;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #476ab1;
        }
        .header-container {
            background-color: black;
            width: 50%;
            padding: 15px 0;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            margin-left: 337.5px;
            margin-bottom: -50px;
            
        }
         .header-container h2 {
            color: white;
            margin: 0;
        }
    </style>
</head>

<body>
    <br><br>
    <div class="header-container">
    <h2>Register Here</h2>
</div>
     <form  action="user_registration" method="post">
    <div class="container">
       
        <form name="register" action="registration" method="post" onsubmit="return validateForm()">
            
            <label>Full Name:</label>
            <input type="text" name="nm" placeholder="Enter your full name" class="form-control" onkeypress="return isString(event)">

            <label>Address:</label>
            <input type="text" name="adrs" class="form-control" placeholder="Enter your address" onkeypress="return isAlphanumeric(event)">

            <label>Contact Number:</label>
            <input type="number" name="cont" class="form-control" placeholder="Enter your mobile number" onkeypress="return isNumeric(event)">

            <label>Email:</label>
            <input type="email" name="mail" class="form-control" placeholder="Enter your email" >

            <label>Select Gender:</label><br>
            <input type="radio" name="gen" value="male"> Male
            <input type="radio" name="gen" value="female"> Female
            <br><br>

            <label>Username:</label>
            <input type="text" name="user" placeholder="Enter a username" onkeypress="return isAlphanumeric(event)">

            <label>Password:</label>
            <input type="password" name="pass" placeholder="Enter a password" onkeypress="return isAlphanumeric(event)">

            <br><br>
            <input type="submit" value="SIGN UP" name="btn">
        </form>
    </div>

     </form>
</body>
</html>
