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
public class admin_login extends HttpServlet {

    
      @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    

 
    
     PrintWriter out=resp.getWriter();
        
        
          String user=req.getParameter("user");
        String apass=req.getParameter("apass");
         String event=req.getParameter("btn");
         
         
          out.println(user);
        out.println(apass);
        
         if(event.equals("Login"))
         {
             try
             {
               if(user.toString().equals("Admin")&& apass.toString().equals("Password"))
        {
        out.println("Login Success");
        resp.sendRedirect("add_car_brand.jsp");
        }
        else
        {
         out.println("Login Faild");
        }  
             }catch(Exception ex)
             {
                 out.println(ex.toString());
             }
         
         }
      }
}
