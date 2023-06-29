package com.miraeweb.sys.code.dao.mybatis;

import com.miraeweb.sys.code.domain.SysCode;
import config.miraeweb.mybatis.mapper.MiraewebMapper;

import java.util.List;

@MiraewebMapper
public interface MyBatisSysCodeDao {

    List<SysCode> selectPreCode(String preCode);

}
