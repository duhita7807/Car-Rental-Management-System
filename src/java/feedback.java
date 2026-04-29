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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
 *
 * @author pc
 */
public class feedback extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   

        
        PrintWriter out = resp.getWriter();
        
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");
       
        String event = req.getParameter("btn");
        
       
        out.println(name);
        out.println(email);
        out.println(message);
        Database db= new Database();
        String result=db.ConnectDB();
        out.println(result);
        
         if(event.equals("Feedback"))
        {
           String insert=db.Insert("insert into feedback(fname, email,message)values('"+name.toString()+"','"+email.toString()+"','"+message.toString()+"')");
     out.println(insert);
     
         resp.setContentType("text/html");
              out.println("<script type=\"text/javascript\">");
            out.println("alert('Feedback Submitted Successfully');");
              out.println("location='index.jsp';");
              out.println("</script>");
        
    }
    }

}
