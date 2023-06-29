package com.miraeweb.user.info.dao.mybatis;

import com.miraeweb.user.info.domain.UserInfo;
import com.miraeweb.user.info.domain.params.UserInfoParams;
import config.miraeweb.mybatis.mapper.MiraewebMapper;

import java.util.List;

@MiraewebMapper
public interface MyBatisUserInfoDao {

     List<UserInfo> selectList(UserInfoParams userInfoParams);
     Integer getTotalCount();
    void insert(UserInfo userInfo);
    void update(UserInfo userInfo);
    void remove(Integer userIdx);
}
