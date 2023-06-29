package config.miraeweb.mybatis.datasource;

import config.miraeweb.mybatis.mapper.MiraewebMapper;
import config.miraeweb.mybatis.prop.DatabaseProperties;
import config.miraeweb.mybatis.prop.MiraewebDatabaseProperties;
import org.apache.commons.dbcp2.BasicDataSource;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;


@Configuration
@MapperScan(basePackages = {
		"com.miraeweb.user.info.dao.mybatis",
		"com.miraeweb.user.career.dao.mybatis",
		"com.miraeweb.user.education.dao.mybatis",
		"com.miraeweb.sys.code.dao.mybatis",

}, annotationClass = MiraewebMapper.class, sqlSessionFactoryRef = "miraewebSqlSessionFactory")

@EnableTransactionManagement
@EnableConfigurationProperties(MiraewebDatabaseProperties.class)
public class MiraewebDataSourceConfig extends MyBatisDataSourceConfig {

	@Autowired
	private DatabaseProperties dbProperties;
	
	@Override
	@Bean(name = "miraewebDataSource")
	public DataSource dataSource() {

		BasicDataSource basicDataSource = new BasicDataSource();
		this.configureDataSource(basicDataSource, dbProperties);
		return basicDataSource;
	}

	@Bean
    public PlatformTransactionManager transactionManager(@Qualifier("miraewebDataSource") DataSource miraewebDataSource) {
        DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(miraewebDataSource);
        transactionManager.setGlobalRollbackOnParticipationFailure(false);
        return transactionManager;
    }
}
