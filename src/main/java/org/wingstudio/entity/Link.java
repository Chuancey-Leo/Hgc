package org.wingstudio.entity;

/**
 * Created by liao on 16-11-16.
 */
public class Link {

    private static final long serialVersionUID = 1L;
    private Integer id;
    private String link;
    private String linkName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }
}
