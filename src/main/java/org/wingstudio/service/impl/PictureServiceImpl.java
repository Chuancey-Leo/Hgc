package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.PictureDao;
import org.wingstudio.entity.Picture;
import org.wingstudio.service.PictureService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liao on 16-11-13.
 */

@Service("pictureService")
public class PictureServiceImpl implements PictureService{

    @Resource
    private PictureDao pictureDao;
    @Override
    public Integer add(Picture picture) {
        return pictureDao.add(picture);
    }
    @Override
    public Picture find() {
        return pictureDao.find();
    }
    @Override
    public Integer remove() {
        return pictureDao.remove();
    }

    @Override
    public List<Picture> list() {
        return pictureDao.list();
    }
}
