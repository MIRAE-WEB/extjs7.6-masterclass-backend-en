package config.miraeweb.mybatis.datasource;


import config.miraeweb.mybatis.prop.DatabaseProperties;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;

import javax.sql.DataSource;


public abstract class MyBatisDataSourceConfig {
	 
		@Bean
	    public abstract DataSource dataSource();
	 
	    protected void configureDataSource(BasicDataSource dataSource, DatabaseProperties dbProperties) {
	        dataSource.setDriverClassName(dbProperties.getDriverClassName());
	        dataSource.setUrl(dbProperties.getUrl());
	        dataSource.setUsername(dbProperties.getUserName());
	        dataSource.setPassword(dbProperties.getPassword());
	        
	        dataSource.setMaxTotal(dbProperties.getMaxTotal());
	        dataSource.setMaxIdle(dbProperties.getMaxIdle());
	        dataSource.setMinIdle(dbProperties.getMinIdle());
	        dataSource.setInitialSize(dbProperties.getMinIdle());
	    	
	        dataSource.setTestOnBorrow(dbProperties.isTestOnBorrow());
	    	dataSource.setTestOnReturn(dbProperties.isTestOnReturn());
	    	
	    	dataSource.setTimeBetweenEvictionRunsMillis(dbProperties.getTimeBetweenEvictionRunsMillis());
	    	dataSource.setValidationQuery(dbProperties.getValidationQuery());
	    	dataSource.setTestWhileIdle(dbProperties.isTestWhileIdle());
	    }
	}
