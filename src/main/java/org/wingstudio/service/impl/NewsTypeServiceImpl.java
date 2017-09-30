package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.NewsTypeDao;
import org.wingstudio.entity.NewsType;
import org.wingstudio.service.NewsTypeService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liao on 16-11-10.
 */
@Service("newsTypeService")
public class NewsTypeServiceImpl implements NewsTypeService{
    @Resource
    private NewsTypeDao newsTypeDao;

    @Override
    public List<NewsType> countList() {
        return newsTypeDao.countList();
    }
}
