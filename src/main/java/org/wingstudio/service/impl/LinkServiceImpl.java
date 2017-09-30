package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.LinkDao;
import org.wingstudio.entity.Link;
import org.wingstudio.service.LinkService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-16.
 */

@Service("linkService")
public class LinkServiceImpl implements LinkService{

    @Resource
    private LinkDao linkDao;

    @Override
    public List<Link> list() {
        return linkDao.list();
    }

    @Override
    public Integer add(Link link) {
        return linkDao.add(link);
    }

    @Override
    public Long getTotal(Map<String,Object> map) {
        return linkDao.getTotal(map);
    }

    @Override
    public Link findLinkById(Integer id) {
        return linkDao.findLinkById(id);
    }

    @Override
    public Integer updateLink(Map<String,Object> map) {
        return linkDao.updateLink(map);
    }

    @Override
    public Integer deleteLink(Integer id) {
        return linkDao.deleteLink(id);
    }
}
