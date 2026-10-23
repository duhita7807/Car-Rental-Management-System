
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
    
    // Override with env vars DB_URL / DB_USER / DB_PASSWORD (e.g. on a server or in Docker)
    static final String URL=env("DB_URL","jdbc:mysql://localhost:3307/car_rental_system");
    static final String USER=env("DB_USER","root");
    static final String PASSWORD=env("DB_PASSWORD","root");

    static String env(String key,String def)
    {
        String v=System.getenv(key);
        return v==null||v.isEmpty()?def:v;
    }

    static Connection getConnection() throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(URL,USER,PASSWORD);
    }

      Connection cn=null;
    Statement st=null;
     String ConnectDB()
    {
      try
      {
         cn=getConnection();
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
