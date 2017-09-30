package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.StyleDao;
import org.wingstudio.entity.Style;
import org.wingstudio.service.StyleService;

import javax.annotation.Resource;

/**
 * Created by liao on 16-12-1.
 */

@Service("styleService")
public class StyleServiceImpl implements StyleService {

    @Resource
    private StyleDao styleDao;

    @Override
    public Integer init() {
        return styleDao.init();
    }

    @Override
    public Integer set(Integer id) {
        return styleDao.set(id);
    }
}
