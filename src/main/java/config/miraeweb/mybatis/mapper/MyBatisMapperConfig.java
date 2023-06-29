package config.miraeweb.mybatis.mapper;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;
import java.io.IOException;

public class MyBatisMapperConfig {
    
    
    public static final String TYPE_ALIASES_PACKAGE = "com.miraeweb";
    public static final String CONFIG_LOCATION_PATH = "classpath:mybatis-config.xml";
    public static final String MAPPER_LOCATIONS_PATH = "classpath*:sqlmap/**/*.xml";
     
    protected void configureSqlSessionFactory(SqlSessionFactoryBean sessionFactoryBean, DataSource dataSource) throws IOException {
        PathMatchingResourcePatternResolver pathResolver = new PathMatchingResourcePatternResolver();
        sessionFactoryBean.setDataSource(dataSource);
        sessionFactoryBean.setTypeAliasesPackage(TYPE_ALIASES_PACKAGE);

        sessionFactoryBean.setConfigLocation(pathResolver.getResource(CONFIG_LOCATION_PATH));
        sessionFactoryBean.setMapperLocations(pathResolver.getResources(MAPPER_LOCATIONS_PATH));
    }
}