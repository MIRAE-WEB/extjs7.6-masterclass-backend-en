package com.miraeweb.sys.code.service;

import com.miraeweb.sys.code.dao.mybatis.MyBatisSysCodeDao;
import com.miraeweb.sys.code.domain.SysCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysCodeService {

    @Autowired
    private MyBatisSysCodeDao myBatisSysCodeDao;

    public List<SysCode> selectPreCode(String preCode){
        return myBatisSysCodeDao.selectPreCode(preCode);
    }
}
