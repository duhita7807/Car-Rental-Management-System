/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
public class payment extends HttpServlet {
 private static final String DB_URL = "jdbc:mysql://localhost:3307/car_rental_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentMethod");
        String fullName = request.getParameter("fullName");
        String cardNumber = request.getParameter("cardNumber");
        String cvv = request.getParameter("cvv");
        String expiryDate = request.getParameter("expiryDate");
        String upiId = request.getParameter("upiId");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement stmt = conn.createStatement();

            String query = "";

            if ("netbanking".equals(paymentMethod)) {
                query = "INSERT INTO payment(payment_method, full_name, card_number, cvv, expiry_date, upi_id) VALUES ('" 
                        + paymentMethod + "', '" 
                        + fullName + "', '" 
                        + cardNumber + "', '" 
                        + cvv + "', '" 
                        + expiryDate + "', NULL)";
            } else if ("upi".equals(paymentMethod)) {
                query = "INSERT INTO payment(payment_method, full_name, card_number, cvv, expiry_date, upi_id) VALUES ('" 
                        + paymentMethod + "', '" 
                        + fullName + "', NULL, NULL, NULL, '" 
                        + upiId + "')";
            }

            int rowsInserted = stmt.executeUpdate(query);

            if (rowsInserted > 0) {
    response.getWriter().println("<script>alert('Payment successful!'); window.location.href = 'feedback.jsp';</script>");
} else {
    response.getWriter().println("<script>alert('Payment failed.'); window.location.href = 'Payment.jsp';</script>");
}


            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
    }

    
    
