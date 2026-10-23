/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pc
 */
public class user_login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        PrintWriter out = resp.getWriter();
        
          String user=req.getParameter("user");
        String apass=req.getParameter("upass");
         String event=req.getParameter("btn");
         
         
          out.println(user);
        out.println(apass);
        
        
        
        
        HttpSession session=req.getSession();
        Connection cn=null;
        Statement st=null;
         if(event.equals("Login"))
         {
             try
             {
            cn=Database.getConnection();
              st=cn.createStatement();
              String sql="select * from ureg where uname='"+user.toString()+"'and psd='"+apass.toString()+"'";
              ResultSet rs=st.executeQuery(sql);
              if(rs.next())
              {
                  
                  session.setAttribute("user", rs.getString("fname"));
                  resp.sendRedirect("view_brands.jsp");
              }
              else
              {
                  out.println("Login Faild");
                  resp.setContentType("text/html;charset=UTF-8");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('login failed');");
        out.println("location='user_login.jsp';");
        out.println("</script>");
              }
                 
             }catch(Exception ex)
             {
                 out.println(ex.toString());
             }
         }
        
    }
 
    

}