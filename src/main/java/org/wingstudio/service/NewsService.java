package org.wingstudio.service;

import org.wingstudio.entity.News;

import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-11.
 */
public interface NewsService {
    //新增新闻
    public Integer add(News news);

    //后台列出所有新闻
    public List<News> list(Map<String,Object> map);
    public List<News> list2(Map<String,Object> map);

    //新闻总数
    public Long getTotal(Map<String,Object> map);


    //更新新闻信息
    public Integer update(News news);

    //通过id查找新闻
    public News findById(Integer id);

    //删除新闻
    public Integer delete(Integer id);

    //置顶新闻
    public Integer toTopNews(Map<String,Object> map);

    //选取置顶的新闻
    public News selectTop();

    //取消置顶
    public Integer cancelTop(Integer id);

    //得到最后一条数据
    public News getLast();

    //得到最近的8条新闻
    public List<News> getRecent();
}
