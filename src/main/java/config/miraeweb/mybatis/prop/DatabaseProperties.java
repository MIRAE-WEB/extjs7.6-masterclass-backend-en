package config.miraeweb.mybatis.prop;

import lombok.Data;

@Data
public class DatabaseProperties {

	private String driverClassName;
	
	private String url;
	
	private String userName;
	
	private String password;
	
	private int maxTotal;
	private int maxIdle;
	
	private int minIdle;
	private boolean testOnBorrow;
	private boolean testOnReturn;
	
	private String validationQuery;	
	
	private boolean testWhileIdle;	
	
	private int timeBetweenEvictionRunsMillis;	
}
