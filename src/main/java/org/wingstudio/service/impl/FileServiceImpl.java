package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.FileDao;
import org.wingstudio.entity.File;
import org.wingstudio.service.FileService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-13.
 */
@Service("fileService")
public class FileServiceImpl implements FileService{
    @Resource
    private FileDao fileDao;

    @Override
    public Integer add(File file) {
        return fileDao.add(file);
    }

    @Override
    public List<File> listFile(Map<String, Object> map) {
        return fileDao.listFile(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return fileDao.getTotal(map);
    }

    @Override
    public Integer delete(Integer id) {
        return fileDao.delete(id);
    }

    @Override
    public File findFileById(Integer id) {
        return fileDao.findFileById(id);
    }

    @Override
    public Integer update(File file) {
        return fileDao.update(file);
    }

    @Override
    public Integer updateFile(File file) {
        return fileDao.updateFile(file);
    }

    @Override
    public File getLast() {
        return fileDao.getLast();
    }
}
