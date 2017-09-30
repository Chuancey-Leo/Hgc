package org.wingstudio.service;

import org.wingstudio.entity.Link;

import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-16.
 */
public interface LinkService {

    //list所有链接
    public List<Link> list();

    //链接总数
    public Long getTotal(Map<String,Object> map);

    //添加友情链接
    public Integer add(Link link);

    //查找link
    public Link findLinkById(Integer id);

    //修改链接
    public Integer updateLink(Map<String,Object> map);

    //删除链接
    public Integer deleteLink(Integer id);
}
