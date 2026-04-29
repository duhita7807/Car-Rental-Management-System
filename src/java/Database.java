
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pc
 */
public class Database {
    
      Connection cn=null;
    Statement st=null;
     String ConnectDB()
    {
      try
      {
         Class.forName("com.mysql.jdbc.Driver");
         cn=DriverManager.getConnection("jdbc:mysql://localhost:3307/car_rental_system","root","root");
         return("Database Connected");
      }catch(Exception ex)
      {
     return(ex.toString());
      }
      
    }
     String Insert(String sql)
    {
        try
        {
            
    st=cn.createStatement();
    st.executeUpdate(sql);           
            
    return("Records Inserted");
        }catch(Exception ex)
        {
        return(ex.toString());
        }
    
    }
    
     
     String Update(String sql)
    {
        try
        {
            
    st=cn.createStatement();
    st.executeUpdate(sql);           
            
    return("Records Inserted");
        }catch(Exception ex)
        {
        return(ex.toString());
        }
    
    }
     
     String Delete(String sql)
    {
        try
        {
            
    st=cn.createStatement();
    st.executeUpdate(sql);           
            
    return("Records Inserted");
        }catch(Exception ex)
        {
        return(ex.toString());
        }
    
    }
    
}
