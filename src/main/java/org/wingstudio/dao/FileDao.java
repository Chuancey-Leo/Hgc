package org.wingstudio.dao;

import org.wingstudio.entity.File;

import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-13.
 */
public interface FileDao {
    //上传文件
    public Integer add(File file);

    //后台list所有文件
    public List<File> listFile(Map<String,Object> map);

    //得到上传文件的总数量（分页使用）
    public Long getTotal(Map<String,Object> map);

    //删除文件
    public Integer delete(Integer id);

    //查找文件
    public File findFileById(Integer id);

    //修改上传的文件信息
    public Integer update(File file);

    //修改上传的文件信息
    public Integer updateFile(File file);

    //最后一条数据
    public File getLast();
}
