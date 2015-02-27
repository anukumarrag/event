/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package moderation;

/**
 *
 * @author anurag
 */
public class PostModel {
    String album_id;
    String post_id;
    String type;
    String link;
    String image_low;
    String image_standard;
    String caption_text;
    String post_time;
    String sender_name;
    String sender_id;
    String sender_pic;
    String control_date;    
    String param;
    String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }
    
    

    public String getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(String album_id) {
        this.album_id = album_id;
    }

    public String getPost_id() {
        return post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImage_low() {
        return image_low;
    }

    public void setImage_low(String image_low) {
        this.image_low = image_low;
    }

    public String getImage_standard() {
        return image_standard;
    }

    public void setImage_standard(String image_standard) {
        this.image_standard = image_standard;
    }

    public String getCaption_text() {
        if(caption_text==null)
        return "";
        else
           return caption_text;
    }

    public void setCaption_text(String caption_text) {
        this.caption_text = caption_text;
    }

    public String getPost_time() {
        return post_time;
    }

    public void setPost_time(String post_time) {
        this.post_time = post_time;
    }

    public String getSender_name() {
        return sender_name;
    }

    public void setSender_name(String sender_name) {
        this.sender_name = sender_name;
    }

    public String getSender_id() {
        return sender_id;
    }

    public void setSender_id(String sender_id) {
        this.sender_id = sender_id;
    }

    public String getSender_pic() {
        return sender_pic;
    }

    public void setSender_pic(String sender_pic) {
        this.sender_pic = sender_pic;
    }

    public String getControl_date() {
        return control_date;
    }

    public void setControl_date(String control_date) {
        this.control_date = control_date;
    }

    @Override
    public String toString() {
        return "PostModel{" + "album_id=" + album_id + ", post_id=" + post_id + ", type=" + type + ", status=" + status + '}';
    }

    
    
    
}
