/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pc
 */
public class booking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       PrintWriter out = resp.getWriter();
String fname = req.getParameter("fname");
String carName = req.getParameter("carName");
String pricePerDay = req.getParameter("price");
String startDate = req.getParameter("startDate");
String endDate = req.getParameter("endDate");
String totalDays = req.getParameter("totalDays");
String totalPrice = req.getParameter("totalpr");
   String event = req.getParameter("Book");
out.println(fname);
out.println(carName);
out.println(pricePerDay);
out.println(startDate);
out.println(endDate);
out.println(totalDays);
out.println(totalPrice);

Database db= new Database();
        String result=db.ConnectDB();
        out.println(result);
        

if(event.equals("Confirm Booking")) { 
    String insert = db.Insert("insert into bookings(fname, car_name, price_per_day,start_date, end_date, total_days, total_price) values('" 
                               + fname.toString() + "','" + carName.toString() + "','" + pricePerDay.toString() + "','" + startDate.toString() + "','" 
                               + endDate.toString() + "','" + totalDays.toString() + "','" + totalPrice.toString() + "')");
    out.println(insert); 
    HttpSession session = req.getSession(); 
    session.setAttribute("totalPrice", totalPrice);
    session.setAttribute("carName", carName); 
    resp.sendRedirect("payment.jsp"); 
}

    }
    
    
}
