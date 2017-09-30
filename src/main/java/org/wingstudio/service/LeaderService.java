package org.wingstudio.service;

import org.wingstudio.entity.Leader;

import java.util.List;

/**
 * Created by liao on 16-11-24.
 */
public interface LeaderService {
    public List<Leader> list();
    //添加领导人
    public Integer addLeader(Leader leader);

    //删除leader
    public Integer delete(Integer id);

    //更新leader信息
    public Integer updateLeader(Leader leader);
}
