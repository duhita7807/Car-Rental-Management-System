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

/**
 *
 * @author pc
 */
public class car_details extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  
        PrintWriter out = resp.getWriter();

String cname = req.getParameter("cname");
String cbrand = req.getParameter("cbrand");
String capacity = req.getParameter("capacity");
String img1 = req.getParameter("img1");
String img2 = req.getParameter("img2");
String rate = req.getParameter("rate");
String mileage = req.getParameter("mileage");
String cdesc = req.getParameter("cdesc");

String event = req.getParameter("btn");

out.println(cname);
out.println(cbrand);
out.println(capacity);
out.println(img1);
out.println(img2);
out.println(rate);
out.println(mileage);
out.println(cdesc);
    

  Database db= new Database();
        String result=db.ConnectDB();
        out.println(result);
        
        if(event.equals("Insert"))
{
   String insert = db.Insert("INSERT INTO car_details(car_name, car_brand, seating_capacity, image1, image2, rate_per_day, mileage, car_description) " +
   "VALUES('"+cname.toString()+"','"+cbrand.toString()+"','"+capacity.toString()+"','"+img1.toString()+"','"+img2.toString()+"','"+rate.toString()+"','"+mileage.toString()+"','"+cdesc.toString()+"')");
   out.println(insert);
   
   resp.setContentType("text/html");
   out.println("<script type=\"text/javascript\">");
   out.println("alert('Car Added Successfully');");
   out.println("location='car_details.jsp';");
   out.println("</script>");
}

if(event.equals("Update"))
{
   String update = db.Update("UPDATE car_details SET car_brand='"+cbrand.toString()+"', seating_capacity='"+capacity.toString()+"', image1='"+img1.toString()+"', image2='"+img2.toString()+"', rate_per_day='"+rate.toString()+"', mileage='"+mileage.toString()+"', car_description='"+cdesc.toString()+"' WHERE car_name='"+cname.toString()+"'");
   out.println(update);
   
   resp.setContentType("text/html");
   out.println("<script type=\"text/javascript\">");
   out.println("alert('"+update+"');");
   out.println("location='car_details.jsp';");
   out.println("</script>");
}

if(event.equals("Delete"))
{
   String delete = db.Delete("DELETE FROM car_details WHERE car_name='"+cname.toString()+"'");
   out.println(delete);
   
   resp.setContentType("text/html");
   out.println("<script type=\"text/javascript\">");
   out.println("alert('"+delete+"');");
   out.println("location='car_details.jsp';");
   out.println("</script>");
}

    }

 
    
}