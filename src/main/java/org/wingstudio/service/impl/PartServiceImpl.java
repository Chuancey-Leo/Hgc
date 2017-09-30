package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.PartDao;
import org.wingstudio.entity.Leader;
import org.wingstudio.entity.Part;
import org.wingstudio.service.PartService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liao on 16-11-24.
 */
@Service("partService")
public class PartServiceImpl implements PartService{

    @Resource
    private PartDao partDao;
    @Override
    public Part getPart(Integer id) {
        return partDao.getPart(id);
    }

    @Override
    public Integer update(Part part) {
        return partDao.update(part);
    }
}
