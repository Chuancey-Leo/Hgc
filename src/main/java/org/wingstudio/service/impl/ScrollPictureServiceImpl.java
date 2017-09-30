package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.ScrollPictureDao;
import org.wingstudio.entity.ScrollPicture;
import org.wingstudio.service.ScrollPictureService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-12-2.
 */

@Service("scrollPictureService")
public class ScrollPictureServiceImpl implements ScrollPictureService{

    @Resource
    private ScrollPictureDao scrollPictureDao;
    @Override
    public Integer update(Map<String, Object> map) {
        return scrollPictureDao.update(map);
    }

    @Override
    public List<ScrollPicture> list() {
        return scrollPictureDao.list();
    }
}
