package org.wingstudio.entity;

import java.util.Date;

/**
 * Created by liao on 16-11-24.
 */
public class Source {
    private Integer id;
    private String title;
    private Integer sourceTypeId;
    private String content;
    private String sourceSize;
    private Date releaseDate;
    private Integer downHit;
    private String sourceName;
    private String releaseDateStr;
    private String contentNoTag;


    public String getContentNoTag() {
        return contentNoTag;
    }

    public void setContentNoTag(String contentNoTag) {
        this.contentNoTag = contentNoTag;
    }

    public String getReleaseDateStr() {
        return releaseDateStr;
    }

    public void setReleaseDateStr(String releaseDateStr) {
        this.releaseDateStr = releaseDateStr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getSourceTypeId() {
        return sourceTypeId;
    }

    public void setSourceTypeId(Integer sourceTypeId) {
        this.sourceTypeId = sourceTypeId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSourceSize() {
        return sourceSize;
    }

    public void setSourceSize(String sourceSize) {
        this.sourceSize = sourceSize;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Integer getDownHit() {
        return downHit;
    }

    public void setDownHit(Integer downHit) {
        this.downHit = downHit;
    }

    public String getSourceName() {
        return sourceName;
    }

    public void setSourceName(String sourceName) {
        this.sourceName = sourceName;
    }
}
