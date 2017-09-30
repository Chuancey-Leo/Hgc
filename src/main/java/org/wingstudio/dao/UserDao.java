package org.wingstudio.dao;

import org.wingstudio.entity.User;

/**
 * Created by liao on 16-11-17.
 */
public interface UserDao {

    //登录查询
    public User getByUserName(String userName);

    //修改密码
    public Integer update(User user);

    //验证密码
    public User check(String password);
}
