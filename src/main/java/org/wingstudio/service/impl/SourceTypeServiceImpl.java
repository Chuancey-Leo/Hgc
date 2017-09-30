package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.SourceTypeDao;
import org.wingstudio.entity.SourceType;
import org.wingstudio.service.SourceTypeService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liao on 16-12-2.
 */

@Service("sourceTypeService")
public class SourceTypeServiceImpl implements SourceTypeService{
    @Resource
    private SourceTypeDao sourceTypeDao;

    @Override
    public List<SourceType> countList() {
        return sourceTypeDao.countList();
    }
}
