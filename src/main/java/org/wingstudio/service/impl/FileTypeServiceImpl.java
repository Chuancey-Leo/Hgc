package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.FileTypeDao;
import org.wingstudio.entity.FileType;
import org.wingstudio.service.FileTypeService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liao on 16-11-12.
 */
@Service("fileTypeService")
public class FileTypeServiceImpl implements FileTypeService{

    @Resource
    private FileTypeDao fileTypeDao;
    @Override
    public List<FileType> countList() {
        return fileTypeDao.countList();
    }
}
