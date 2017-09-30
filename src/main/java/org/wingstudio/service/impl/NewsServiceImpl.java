package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.NewsDao;
import org.wingstudio.entity.News;
import org.wingstudio.service.NewsService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-11.
 */
@Service("newsService")
public class NewsServiceImpl implements NewsService{
    @Resource
    NewsDao newsDao;
    @Override
    public Integer add(News news) {
        return newsDao.add(news);
    }

    @Override
    public List<News> list(Map<String,Object> map) {
        return newsDao.list(map);
    }

    @Override
    public List<News> list2(Map<String, Object> map) {
        return newsDao.list2(map);
    }

    @Override
    public Long getTotal(Map<String,Object> map) {
        return newsDao.getTotal(map);
    }

    @Override
    public Integer update(News news) {
        return newsDao.update(news);
    }

    @Override
    public News findById(Integer id) {
        return newsDao.findById(id);
    }

    @Override
    public Integer delete(Integer id) {
        return newsDao.delete(id);
    }

    @Override
    public Integer toTopNews(Map<String,Object> map) {
        return newsDao.toTopNews(map);
    }

    @Override
    public News selectTop() {
        return newsDao.selectTop();
    }

    @Override
    public Integer cancelTop(Integer id) {
        return newsDao.cancelTop(id);
    }

    @Override
    public News getLast() {
        return newsDao.getLast();
    }

    @Override
    public List<News> getRecent() {
        return newsDao.getRecent();
    }
}
