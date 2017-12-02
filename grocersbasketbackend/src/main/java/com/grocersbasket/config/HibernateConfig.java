package com.grocersbasket.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;



	@Configuration
	@EnableTransactionManagement
	@ComponentScan( "com" )

	public class HibernateConfig {
		
		 private Properties hibernateProperties() {
		    	System.out.println("inside hibernateProperties");
		        Properties properties = new Properties();
		        properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		        properties.put("hibernate.show_sql","true");
		        properties.put("hibernate.format_sql","true");
		        properties.put("hibernate.hbm2ddl.auto","update");
		        return properties;        
		    }
		     
	 
		 
	    @Bean
	    public SessionFactory sessionFactory(DataSource dataSource) {
			System.out.println("inside SessionFactory");
	        LocalSessionFactoryBuilder sessionFactory = new LocalSessionFactoryBuilder(dataSource);
	        sessionFactory.addProperties(hibernateProperties());
	        sessionFactory.scanPackages("com");
			return sessionFactory.buildSessionFactory();
	     }
	    
		
		
	    @Bean
	    public DataSource dataSource() {
			System.out.println("inside dataSource");
	        DriverManagerDataSource dataSource = new DriverManagerDataSource();
	        dataSource.setDriverClassName("org.h2.Driver");
	        dataSource.setUrl("jdbc:h2:~/test");
	        dataSource.setUsername("sa");
	        dataSource.setPassword("sa");
	        return dataSource;
	    }
	     
	   
	     
	    @Bean
	    public HibernateTransactionManager transactionManager(SessionFactory s) {
	    	System.out.println("inside transactionManager");
	       HibernateTransactionManager txManager = new HibernateTransactionManager();
	       txManager.setSessionFactory(s);
	       return txManager;
	    }
	}

