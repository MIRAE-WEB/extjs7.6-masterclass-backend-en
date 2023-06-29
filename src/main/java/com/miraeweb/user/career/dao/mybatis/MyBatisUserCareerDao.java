package com.miraeweb.user.career.dao.mybatis;

import com.miraeweb.user.career.domain.UserCareer;
import config.miraeweb.mybatis.mapper.MiraewebMapper;

import java.util.List;

@MiraewebMapper
public interface MyBatisUserCareerDao {

     List<UserCareer> selectList(Integer userIdx);
     void insert(UserCareer userCareer);
     void update(UserCareer userCareer);
     void delete(Integer userCareerIdx);

}
