package com.tiy.ssa.exerciseWebApp.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.tiy.ssa.exerciseWebApp.entity.Exercise;
import com.tiy.ssa.exerciseWebApp.entity.Exercise_Category;
import com.tiy.ssa.exerciseWebApp.entity.Userinfo;


@Configuration
@EnableTransactionManagement
public class DbConfiguration {
	@Bean
    public HibernateTemplate hibernateTemplate() {
        return new HibernateTemplate(sessionFactory());
    }

    @Bean
    public DataSource getDataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/tiy2?autoReconnect=true&useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("qwert");
        return dataSource;
    }

    @Bean
    public SessionFactory sessionFactory() {
        return new LocalSessionFactoryBuilder(getDataSource()).addAnnotatedClasses(Userinfo.class)
        		.addAnnotatedClass(Exercise.class)
        		.addAnnotatedClass(Exercise_Category.class)
                .buildSessionFactory();
    }

    @Bean
    public HibernateTransactionManager hibTransMan() {
        return new HibernateTransactionManager(sessionFactory());
    }
}
