<%-- 
    Document   : booking
    Created on : 27 Apr, 2025, 11:20:57 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Destination Booking</title>
    <link rel="stylesheet" href="bootstrap.css">
    <script src="validation.js"></script>

    <script>  
        function cal() {
            var startDate = new Date(document.getElementById("startDate").value);
            var endDate = new Date(document.getElementById("endDate").value);
            
            if (startDate && endDate && endDate >= startDate) {
                var timeDiff = endDate - startDate;
                var totalDays = timeDiff / (1000 * 3600 * 24);  // Convert milliseconds to days
                document.getElementById("totalDays").value = totalDays;

                var pricePerDay = document.getElementById("price").value;
                document.getElementById("tp").value = totalDays * pricePerDay;
            } else {
                document.getElementById("totalDays").value = "";
                document.getElementById("tp").value = "";
            }
        }

        function validatePayment() {
            var cardNumber = document.getElementById("card").value;
            var cvv = document.getElementById("cvv").value;

            if (cardNumber.length !== 16 || isNaN(cardNumber)) {
                alert("Please enter a valid 16-digit card number.");
                return false;
            }

            if (cvv.length !== 3 || isNaN(cvv)) {
                alert("Please enter a valid 3-digit CVV.");
                return false;
            }

            return true;
        }
    </script>

    <style>
        body {
            background-image: url('car4.jfif');
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 100%;
            max-width: 450px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            margin-left: 250px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            float: left;
            font-weight: bold;
            margin-top: 10px;
        }

        input[type=text], input[type=number], input[type=password], input[type=date] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type=submit]:hover {
            background-color: #0056b3;
        }

        .btn-cancel {
            background-color: #dc3545;
        }

        .btn-cancel:hover {
            background-color: #a71d2a;
        }
    </style>
</head> 

<body>
    <div class="container">
        <h2>Book Your Car Rental</h2>

        <%
            // Retrieve car details from the request
            String carName = request.getParameter("car_name");
            String pricePerDay = request.getParameter("rate_per_day");
        %>

        <form name="abc" action="booking" method="post" >
            <label>Full Name:</label>
            <input type="text" name="fname" placeholder="Enter Your Full Name" required>

            <label>Car Name:</label>
            <input type="text" name="carName" value="<%= carName %>" readonly>

            <label>Price per Day:</label>
            <input type="number" name="price" id="price" value="<%= pricePerDay %>" readonly>

            <label>Start Date:</label>
            <input type="date" id="startDate" name="startDate" onchange="cal()" required>

            <label>End Date:</label>
            <input type="date" id="endDate" name="endDate" onchange="cal()" required>

            <label>Total Days:</label>
            <input type="number" id="totalDays" name="totalDays" placeholder="Total number of days" readonly>

            <label>Total Price:</label>
            <input type="number" id="tp" name="totalpr" placeholder="Your total price is:" readonly>

            <input type="submit" name="Book" value="Confirm Booking">
        </form>
    </div>
</body>
</html>
