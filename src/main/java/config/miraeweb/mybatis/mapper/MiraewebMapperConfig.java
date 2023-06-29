package config.miraeweb.mybatis.mapper;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;


import javax.sql.DataSource;


@Configuration
public class MiraewebMapperConfig extends MyBatisMapperConfig {



	@Bean
	@Primary
	public SqlSessionFactory miraewebSqlSessionFactory(@Qualifier("miraewebDataSource") DataSource miraewebMyBatisDataSource) throws Exception {
		SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
		this.configureSqlSessionFactory(sessionFactoryBean, miraewebMyBatisDataSource);
		return sessionFactoryBean.getObject();
	}
}
