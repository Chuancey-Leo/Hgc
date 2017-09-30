package org.wingstudio.entity;


/**
 * Created by liao on 16-11-13.
 */
public class Picture {
    private Integer id;
    private String imgUrl;
    private Integer flag;

    public Integer getFlag() {
        return flag;
    }
    public void setFlag(Integer flag) {
        this.flag = flag;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }


}
