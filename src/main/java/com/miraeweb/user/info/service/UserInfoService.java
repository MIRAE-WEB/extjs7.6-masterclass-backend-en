package com.miraeweb.user.info.service;

import com.miraeweb.user.info.dao.mybatis.MyBatisUserInfoDao;
import com.miraeweb.user.info.domain.UserInfo;
import com.miraeweb.user.info.domain.params.UserInfoParams;
import com.miraeweb.user.info.domain.result.UserInfoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoService {


    @Autowired
    private MyBatisUserInfoDao myBatisUserInfoDao;

    public UserInfoResult selectUsers(UserInfoParams userInfoParams){

        List<UserInfo> listUsers = myBatisUserInfoDao.selectList(userInfoParams);
        Integer totalCount = myBatisUserInfoDao.getTotalCount();
        return UserInfoResult.builder()
                .users(listUsers)
                .totalCount(totalCount)
                .build();
    }

    public void insert(UserInfo userInfo) {
        myBatisUserInfoDao.insert(userInfo);
    }

    public void update(UserInfo userInfo) {

        myBatisUserInfoDao.update(userInfo);
    }

    public void remove(Integer userIdx) {
        myBatisUserInfoDao.remove(userIdx);
    }
}
