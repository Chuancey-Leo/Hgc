package org.wingstudio.service.impl;

import org.springframework.stereotype.Service;
import org.wingstudio.dao.LeaderDao;
import org.wingstudio.entity.Leader;
import org.wingstudio.service.LeaderService;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liao on 16-11-24.
 */

@Service("leaderService")
public class LeaderServiceImpl implements LeaderService{

    @Resource
    private LeaderDao leaderDao;

    @Override
    public List<Leader> list() {
        return leaderDao.list();
    }
    @Override
    public Integer addLeader(Leader leader) {
        return leaderDao.addLeader(leader);
    }

    @Override
    public Integer delete(Integer id) {
        return leaderDao.delete(id);
    }

    @Override
    public Integer updateLeader(Leader leader) {
        return leaderDao.updateLeader(leader);
    }
}
