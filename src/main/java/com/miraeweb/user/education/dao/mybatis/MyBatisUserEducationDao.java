package com.miraeweb.user.education.dao.mybatis;

import com.miraeweb.user.education.domain.UserEducation;
import config.miraeweb.mybatis.mapper.MiraewebMapper;

import java.util.List;

@MiraewebMapper
public interface MyBatisUserEducationDao {

     List<UserEducation> selectList(Integer userIdx);
     void insert(UserEducation userEducation);
     void update(UserEducation userEducation);
     void delete(Integer userEducationIdx);

}
