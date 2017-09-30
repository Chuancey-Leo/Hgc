package org.wingstudio.dao;

import org.wingstudio.entity.File;
import org.wingstudio.entity.Leader;
import org.wingstudio.entity.Part;

import java.util.List;
import java.util.Map;

/**
 * Created by liao on 16-11-13.
 */
public interface PartDao {

    public Part getPart(Integer id);

    //更新部门信息
    public Integer update(Part part);
}
