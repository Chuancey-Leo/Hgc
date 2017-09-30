package org.wingstudio.entity;

import java.util.Date;

/**
 * Created by liao on 16-11-11.
 */
public class File {
    private Integer id;
    private String title;
    private Integer fileTypeId;
    private String content;
    private String fileSize;
    private Date releaseDate;
    private Integer clickHit;
    private String fileName;
    private String releaseDateStr;
    private String contentNoTag;

    public Integer getClickHit(){
        return clickHit;
    }
    public void setClickHit(Integer clickHit){
        this.clickHit = clickHit;
    }
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

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFileTypeId() {
        return fileTypeId;
    }

    public void setFileTypeId(Integer fileTypeId) {
        this.fileTypeId = fileTypeId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }
}
