package com.miraeweb.user.education.service;

import com.miraeweb.user.education.dao.mybatis.MyBatisUserEducationDao;
import com.miraeweb.user.education.domain.UserEducation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserEducationService {

    @Autowired
    private MyBatisUserEducationDao myBatisUserEducationDao;

    public List<UserEducation> selectList(Integer userIdx){
        return myBatisUserEducationDao.selectList(userIdx);
    }

    public void modifyUserEducation(List<UserEducation> listUserEducation) {

        
        for(UserEducation userEducation : listUserEducation){

            String flag = userEducation.getFlag();
            Integer userEducationIdx = userEducation.getUserEducationIdx();
            
            switch(flag){
                case "I":
                    myBatisUserEducationDao.insert(userEducation);
                    break;
                case "U":
                    myBatisUserEducationDao.update(userEducation);
                    break;
                case "D":
                    myBatisUserEducationDao.delete(userEducationIdx);
                    break;
                
            }
        }
        
    }
}
