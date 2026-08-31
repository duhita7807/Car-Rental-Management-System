<%-- 
    Document   : payment
    Created on : 27 Apr, 2025, 11:32:33 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Payment</title>
    <link rel="stylesheet" href="bootstrap.css">
    <script src="validation.js"></script>

    <script>
        function showPaymentOption() {
            var paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
            document.getElementById('netBankingForm').style.display = paymentMethod === 'netbanking' ? 'block' : 'none';
            document.getElementById('upiForm').style.display = paymentMethod === 'upi' ? 'block' : 'none';
        }

        function validatePayment() {
            var paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
            
            if (paymentMethod === 'netbanking') {
                var cardNumber = document.getElementById('cardNumber').value;
                var cvv = document.getElementById('cvv').value;
                var expiry = document.getElementById('expiryDate').value;

                if (cardNumber.length !== 16 || isNaN(cardNumber)) {
                    alert("Please enter a valid 16-digit card number.");
                    return false;
                }

                if (cvv.length !== 3 || isNaN(cvv)) {
                    alert("Please enter a valid 3-digit CVV.");
                    return false;
                }

                if (!expiry) {
                    alert("Please enter the expiry date.");
                    return false;
                }
            } else if (paymentMethod === 'upi') {
                var upiId = document.getElementById('upiId').value;
                if (!upiId) {
                    alert("Please enter a valid UPI ID.");
                    return false;
                }
            }
            return true;
        }

       
        document.addEventListener('DOMContentLoaded', () => {
            let today = new Date().toISOString().split('T')[0];
            document.getElementById('expiryDate').setAttribute('min', today);
        });
    </script>

    <style>
        body {
            background-color: lightsteelblue;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
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
            background-color: #007BFF;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: 0.3s;
        }

        input[type=submit]:hover {
            background-color: #0056b3;
        }

        .payment-option {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Payment</h2>


        <form action="payment" method="post" >
       

          

            <div class="payment-option">
                <label>Payment Method:</label>
                <input type="radio" name="paymentMethod" value="netbanking" onclick="showPaymentOption()" required> Net Banking
                <input type="radio" name="paymentMethod" value="upi" onclick="showPaymentOption()"> UPI
            </div>

            <!-- Net Banking Form -->
            <div id="netBankingForm" style="display: none;">
                <label>Full Name:</label>
                <input type="text" name="fullName" placeholder="Enter Full Name">
                <label>Card Number:</label>
                <input type="text" name="cardNumber" id="cardNumber" placeholder="Enter 16-digit Card Number" onkeypress="return isNumber(event)" maxlength="16">
                <label>CVV:</label>
                <input type="password" name="cvv" id="cvv" placeholder="Enter 3-digit CVV" onkeypress="return isNumber(event)" maxlength="3">
                <label>Expiry Date:</label>
                <input type="date" name="expiryDate" id="expiryDate">
            </div>

            <!-- UPI Form -->
            <div id="upiForm" style="display: none;">
                <label>UPI ID:</label>
                <input type="text" name="upiId" id="upiId" placeholder="Enter UPI ID">
            </div>
            <br>
            <input type="submit" name="paymentMethod" value="Pay">
        </form>
    </div>
</body>
</html>
