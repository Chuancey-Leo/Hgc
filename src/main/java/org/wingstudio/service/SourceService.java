package org.wingstudio.service;

import org.wingstudio.entity.File;
import org.wingstudio.entity.Source;

import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-13.
 */
public interface SourceService {
    //上传资源
    public Integer add(Source source);

    //后台list所有资源
    public List<Source> listSource(Map<String, Object> map);

    //得到上传文件的总数量（分页使用）
    public Long getTotal(Map<String, Object> map);

    //删除文件
    public Integer delete(Integer id);

    //查找文件
    public Source findSourceById(Integer id);

    //修改上传的文件信息
    public Integer update(Source source);

    //得到最后一条数据
    public Source getLast();
}
