/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
public class payment extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentMethod");
        String fullName = request.getParameter("fullName");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String upiId = request.getParameter("upiId");

        try {
            Connection conn = Database.getConnection();
            boolean card = "card".equals(paymentMethod);
            // Never store the full card number or CVV - keep only the last 4 digits
            String masked = card && cardNumber != null && cardNumber.length() >= 4
                    ? "XXXX-XXXX-XXXX-" + cardNumber.substring(cardNumber.length() - 4) : null;
            PreparedStatement stmt = conn.prepareStatement(
                    "INSERT INTO payment(payment_method, full_name, card_number, expiry_date, upi_id) VALUES (?, ?, ?, ?, ?)");
            stmt.setString(1, paymentMethod);
            stmt.setString(2, fullName);
            stmt.setString(3, masked);
            stmt.setString(4, card ? expiryDate : null);
            stmt.setString(5, card ? null : upiId);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
    response.getWriter().println("<script>alert('Payment successful!'); window.location.href = 'feedback.jsp';</script>");
} else {
    response.getWriter().println("<script>alert('Payment failed.'); window.location.href = 'payment.jsp';</script>");
}


            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
    }

    
    
