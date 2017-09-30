package org.wingstudio.service;

import org.wingstudio.entity.ScrollPicture;

import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-12-2.
 */


public interface ScrollPictureService {
    //修改图片
    public Integer update(Map<String,Object> map);
    //轮播图片列表
    public List<ScrollPicture> list();
}
