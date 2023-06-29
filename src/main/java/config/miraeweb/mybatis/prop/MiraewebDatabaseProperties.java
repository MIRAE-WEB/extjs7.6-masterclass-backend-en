package config.miraeweb.mybatis.prop;


import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix="spring.datasource.miraeweb")
public class MiraewebDatabaseProperties extends DatabaseProperties{
	
}
