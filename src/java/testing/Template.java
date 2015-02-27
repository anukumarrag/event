/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author anurag
 */
public class Template {
    
    public static String getTemplate(Connection c,String id){
        
        String template=null;
        try{
            String sql="select image from theme where album_id='"+id+"'";
            PreparedStatement ps=c.prepareCall(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                template=rs.getString("image");
                
            }
            
        }
        catch(Exception e){
            System.out.println("Exception in getTemplate"+e);
        }
        
        return template;
    }
    
}
