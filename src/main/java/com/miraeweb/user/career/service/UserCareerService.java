package com.miraeweb.user.career.service;

import com.miraeweb.user.career.dao.mybatis.MyBatisUserCareerDao;
import com.miraeweb.user.career.domain.UserCareer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserCareerService {

    @Autowired
    private MyBatisUserCareerDao myBatisUserCareerDao;

    public List<UserCareer> selectList(Integer userIdx){
        return myBatisUserCareerDao.selectList(userIdx);
    }

    public void modifyUserCareer(List<UserCareer> listUserCareer) {


        for(UserCareer userCareer : listUserCareer){

            String flag = userCareer.getFlag();
            Integer userCareerIdx = userCareer.getUserCareerIdx();

            switch(flag){
                case "I":
                    myBatisUserCareerDao.insert(userCareer);
                    break;
                case "U":
                    myBatisUserCareerDao.update(userCareer);
                    break;
                case "D":
                    myBatisUserCareerDao.delete(userCareerIdx);
                    break;

            }
        }

    }
}
