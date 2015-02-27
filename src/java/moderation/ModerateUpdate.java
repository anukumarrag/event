/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package moderation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anurag
 */
public class ModerateUpdate {
    String hash;
    String album_id;
    Connection con;
    public ModerateUpdate( String hash,String album_id,Connection con ) {
        this.hash=hash;
        this.album_id=album_id;
        this.con=con;
    }
    
    public List getAllPost(){
        List posts=new ArrayList();
       
        try{
          String sql="select * from album where  album_id='"+album_id+"' and hash_tag='"+hash+"'";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                PostModel post=new PostModel();
                post.setAlbum_id(rs.getString("album_id"));
                post.setPost_id(rs.getString("post_id"));
                post.setCaption_text(rs.getString("caption_text"));
                post.setCaption_text(rs.getString("sender_name"));
                post.setImage_standard(rs.getString("image_standard"));
                posts.add(post);
            }
        
        }
        catch(Exception e){
            System.out.println("Exception in getAllPost method in ModerateUpdate class "+e);
        }
        
        return posts;
    }
    
}
