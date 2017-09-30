package org.wingstudio.service;

import org.wingstudio.entity.Leader;
import org.wingstudio.entity.Part;

import java.util.List;

/**
 * Created by liao on 16-11-13.
 */
public interface PartService {

    public Part getPart(Integer id);

    //更新部门信息
    public Integer update(Part part);
}
