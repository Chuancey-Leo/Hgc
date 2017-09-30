package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.SourceDao;
import org.wingstudio.entity.Source;
import org.wingstudio.service.SourceService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-24.
 */

@Service("sourceService")
public class SourceServiceImpl implements SourceService{

    @Resource
    private SourceDao sourceDao;

    @Override
    public Integer add(Source source) {
        return sourceDao.add(source);
    }

    @Override
    public List<Source> listSource(Map<String, Object> map) {
        return sourceDao.listSource(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return sourceDao.getTotal(map);
    }

    @Override
    public Integer delete(Integer id) {
        return sourceDao.delete(id);
    }

    @Override
    public Source findSourceById(Integer id) {
        return sourceDao.findSourceById(id);
    }

    @Override
    public Integer update(Source source) {
        return sourceDao.update(source);
    }

    @Override
    public Source getLast() {
        return sourceDao.getLast();
    }
}
