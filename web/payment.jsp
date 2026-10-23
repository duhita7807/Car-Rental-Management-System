<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/includes/db.jspf" %>
<%
    Object total = session.getAttribute("totalPrice");
    Object car = session.getAttribute("carName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment - DriveEase</title>
    <%@ include file="WEB-INF/includes/head.jspf" %>
</head>
<body>
<%@ include file="WEB-INF/includes/header.jspf" %>

<main>
<div class="page-head">
  <div class="container">
    <h1>Secure payment</h1>
    <p>Your booking is reserved. Complete payment to confirm it.</p>
  </div>
</div>

<div class="container py-5">
  <div class="row g-4">
    <div class="col-lg-7">
      <form action="payment" method="post" class="form-card" onsubmit="return validatePayment()">
        <h5 class="mb-3">Payment method</h5>
        <div class="row g-3 mb-4">
          <div class="col-6">
            <label class="pay-option"><input type="radio" name="paymentMethod" value="card" onclick="showPaymentOption()" required> Debit / Credit card</label>
          </div>
          <div class="col-6">
            <label class="pay-option"><input type="radio" name="paymentMethod" value="upi" onclick="showPaymentOption()"> UPI</label>
          </div>
        </div>

        <div id="cardForm" style="display:none">
          <div class="mb-3">
            <label class="form-label">Name on card</label>
            <input type="text" name="fullName" class="form-control" placeholder="Full name">
          </div>
          <div class="mb-3">
            <label class="form-label">Card number</label>
            <input type="text" name="cardNumber" id="cardNumber" class="form-control" placeholder="1234 5678 9012 3456" inputmode="numeric" maxlength="16">
          </div>
          <div class="row g-3">
            <div class="col-6">
              <label class="form-label">Expiry</label>
              <input type="month" name="expiryDate" id="expiryDate" class="form-control">
            </div>
            <div class="col-6">
              <label class="form-label">CVV</label>
              <input type="password" id="cvv" class="form-control" placeholder="&bull;&bull;&bull;" inputmode="numeric" maxlength="3">
            </div>
          </div>
        </div>

        <div id="upiForm" style="display:none">
          <label class="form-label">UPI ID</label>
          <input type="text" name="upiId" id="upiId" class="form-control" placeholder="name@okbank">
        </div>

        <button type="submit" class="btn btn-accent w-100 mt-4">Pay &#8377;<%= total == null ? "" : esc(total) %></button>
        <p class="small text-muted text-center mt-3 mb-0">&#128274; Your CVV is never stored.</p>
      </form>
    </div>

    <div class="col-lg-5">
      <div class="summary">
        <h5 class="mb-3">Order summary</h5>
        <div class="row-line"><span>Car</span><span><%= car == null ? "-" : esc(car) %></span></div>
        <div class="row-line"><span>Insurance &amp; taxes</span><span>Included</span></div>
        <div class="total"><span>Amount due</span><span>&#8377;<%= total == null ? "0" : esc(total) %></span></div>
      </div>
    </div>
  </div>
</div>
</main>

<%@ include file="WEB-INF/includes/footer.jspf" %>
<script>
    document.getElementById('expiryDate').min = new Date().toISOString().slice(0, 7);

    function method() {
        var m = document.querySelector('input[name="paymentMethod"]:checked');
        return m ? m.value : '';
    }

    function showPaymentOption() {
        document.getElementById('cardForm').style.display = method() === 'card' ? 'block' : 'none';
        document.getElementById('upiForm').style.display = method() === 'upi' ? 'block' : 'none';
    }

    function validatePayment() {
        if (method() === 'card') {
            if (!/^\d{16}$/.test(document.getElementById('cardNumber').value)) { alert('Please enter a valid 16-digit card number.'); return false; }
            if (!/^\d{3}$/.test(document.getElementById('cvv').value)) { alert('Please enter a valid 3-digit CVV.'); return false; }
            if (!document.getElementById('expiryDate').value) { alert('Please enter the expiry date.'); return false; }
        } else if (method() === 'upi') {
            if (!/^[\w.\-]+@[\w]+$/.test(document.getElementById('upiId').value)) { alert('Please enter a valid UPI ID.'); return false; }
        }
        return true;
    }
</script>
</body>
</html>
