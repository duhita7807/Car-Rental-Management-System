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
public class user_registration extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      PrintWriter out = resp.getWriter();
        
        
        
        String fname = req.getParameter("nm");
        String addres = req.getParameter("adrs");
        String ctno = req.getParameter("cont");
        String email = req.getParameter("mail");
        String gender = req.getParameter("gen");
        String uname = req.getParameter("user");
        String psd = req.getParameter("pass");
        String event = req.getParameter("btn");
        
        
        out.println(fname);
        out.println(addres);
        out.println(ctno);
        out.println(email);
        out.println(gender);
        out.println(uname);
        out.println(psd);
        
        
         Database db= new Database();
        String result=db.ConnectDB();
        out.println(result);
         
        if(event.equals("SIGN UP"))
        {
           String insert=db.Insert("insert into ureg(fname, addres,ctno,email,gender,uname,psd)values('"+fname.toString()+"','"+addres.toString()+"','"+ctno.toString()+"','"+email.toString()+"','"+gender.toString()+"','"+uname.toString()+"','"+psd.toString()+"')");
           out.println(insert);
           
            resp.setContentType("text/html");
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Registration Successfully');");
              out.println("location='user_login.jsp';");
              out.println("</script>");
           
        }
    }


}