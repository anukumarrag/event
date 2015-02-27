/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package setting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author anurag
 */
public class Conn {

   
    private Connection con;
    public Conn(){
        try {
          Class.forName("com.mysql.jdbc.Driver");
            DBA db = new DBA();
            String url = db.getUrl()+ db.getDb() + "?autoReconnect=true";
            this.con = DriverManager.getConnection(url, db.getUn(), db.getUp());
        } catch (Exception  ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
    
   public Connection getConnection(){
       
       return con;
   }
   
   public int isPageexist(String id , String table) throws SQLException{
       int result=0;
       Connection c=null;
       try{
           c=new Conn().getConnection();
       Statement s=c.createStatement();
       String sql="select count(page_id) as count from "+table+" where page_id='"+id+"'";
       ResultSet rs=s.executeQuery(sql);
           while (rs.next()) {
               result=rs.getInt("count");
               
           }
          return result;
       }
       catch(Exception ex){
           Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
           return -1;
       }
       finally{
           if(c!=null)
               c.close();
           
           
       }
       
   }
   
   
    public static int isCorrectLogin(Connection c,String username , String password) throws SQLException{
       int result=0;
       try{
       Statement s=c.createStatement();
       String sql="select count(email) as count from login where email='"+username+"' and password='"+password+"'";
           //System.out.println(sql);
       ResultSet rs=s.executeQuery(sql);
           while (rs.next()) {
               result=rs.getInt("count");
               
           }
          return result;
       }
       catch(Exception ex){
           Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
           return -1;
       }
       finally{
           if(c!=null)
               c.close();
       }
       
   }
    
    public static ResultSet getResult(Connection con,String sql) throws SQLException{
        ResultSet rs=null;
         
        
        try{
            con=new Conn().getConnection();
            Statement s=con.createStatement();
             rs=s.executeQuery(sql);
        }
        catch(SQLException e){
            System.out.println(" From DataBase class "+e);
        }
        
        return rs;
        
    }
    
    
    // it is test for new page add in clientfbpage...
    
    public static int isAvailable(String page_id,String username) throws SQLException{
        int result=0;
        Connection c=null;
         try{
             c=new Conn().getConnection();    
       Statement s=c.createStatement();
       String sql="select count(username) as count from clientfbpage where username='"+username+"' and page_id='"+page_id+"'";
           //System.out.println(sql);
       ResultSet rs=s.executeQuery(sql);
           while (rs.next()) {
               result=rs.getInt("count");
               
           }
           
       }
       catch(Exception ex){
           Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
           return -1;
       }
       finally{
           if(c!=null)
               c.close();
       }
       
        return result;
    }
    
   public static int insertFBAnalysisPage(String page_id,String username) throws SQLException{
       int result=0;
       Connection c=null;
       try{
           c=new Conn().getConnection();
           Statement s=c.createStatement();
           String sql="insert into clientfbpage (page_id,username,status) values('"+page_id+"','"+username+"','active')";
           s.execute(sql);
           result=1;
           
       
       }
       catch(Exception e){
           return -1;
       }
       finally{
           if(null!=c)
               c.close();
       }
       return result;
   } 
    
    
    public static void main(String[] args) throws SQLException {
        
        System.out.println(new Conn().getConnection());
        
    }
    
    
    
}
