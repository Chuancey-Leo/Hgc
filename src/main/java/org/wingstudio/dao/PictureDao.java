package org.wingstudio.dao;

import org.wingstudio.entity.File;
import org.wingstudio.entity.Picture;

import java.util.List;

/**
 * Created by liao on 16-11-13.
 */
public interface PictureDao {
    public Integer add(Picture picture);
    public Picture find();
    public Integer remove();

    //列出所有的最近图片
    public List<Picture> list();
}
