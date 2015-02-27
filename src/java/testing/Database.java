/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package testing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author anurag
 */
public class Database {
    
    
    
    public static ResultSet getResultset(String sql, Connection con) throws SQLException {
        ResultSet rs=null;
        Statement s=con.createStatement();
        rs=s.executeQuery(sql);
        return rs;
    }
    
    
    public static int doInsert(String sql, Connection con) throws SQLException {
        
        //Statement s=con.createStatement();
        PreparedStatement ps=con.prepareStatement(sql);
        int status=ps.executeUpdate();
        return status;
    }
    
    
    public static int doUpdate(String sql, Connection con) throws SQLException {
        
        Statement s=con.createStatement();
      int status=s.executeUpdate(sql);
        return status;
    }
    
    
    public static boolean doDelete(String sql, Connection con) throws SQLException {
        
        Statement s=con.createStatement();
      boolean status=s.execute(sql);
        return status;
    }
    
   public static int resultCount(String sql, Connection con) throws SQLException {
        
        Statement s=con.createStatement();
     ResultSet rs=s.executeQuery(sql);
    rs.next();
    return rs.getInt(1);
    }
    
    
}
