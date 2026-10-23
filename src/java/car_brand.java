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
public class car_brand extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
          PrintWriter out = resp.getWriter();
        
        String bname = req.getParameter("bname");
String img = req.getParameter("brand_image");
String description = req.getParameter("brand_desc");

String event = req.getParameter("btn");

out.println(bname);
out.println(img);
out.println(description);
     Database db= new Database();
        String result=db.ConnectDB();
        out.println(result);
        try {
           
       } catch (Exception e) {
       }
         if (event.equals("Insert")) {
    String insert = db.Insert("insert into car_brand(bname, brand_image, brand_desc) values('" + bname.toString() + "','" + img.toString() + "','" + description.toString() + "')");
    out.println(insert);

    resp.setContentType("text/html");
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Car Brand Added Successfully');");
    out.println("location='add_car_brand.jsp';");
    out.println("</script>");
}

         
         if (event.equals("Update")) {
    String Update = db.Update("update car_brand set brand_image='" + img.toString() + "', brand_desc='" + description.toString() + "' where bname='" + bname.toString() + "'");
    out.println(Update);

    resp.setContentType("text/html");
    out.println("<script type=\"text/javascript\">");
    out.println("alert('" + Update + "');");
    out.println("location='add_car_brand.jsp';");
    out.println("</script>");
}

if (event.equals("Delete")) {
    String Delete = db.Delete("delete from car_brand where bname='" + bname.toString() + "'");
    out.println(Delete);

    resp.setContentType("text/html");
    out.println("<script type=\"text/javascript\">");
    out.println("alert('" + Delete + "');");
    out.println("location='add_car_brand.jsp';");
    out.println("</script>");
}


    }

    
    }