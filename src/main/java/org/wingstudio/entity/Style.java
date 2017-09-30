package org.wingstudio.entity;

/**
 * Created by liao on 16-12-1.
 */
public class Style {
    private Integer id;
    private String cssName;
    private Integer flat;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCssName() {
        return cssName;
    }

    public void setCssName(String cssName) {
        this.cssName = cssName;
    }

    public Integer getFlat() {
        return flat;
    }

    public void setFlat(Integer flat) {
        this.flat = flat;
    }
}
