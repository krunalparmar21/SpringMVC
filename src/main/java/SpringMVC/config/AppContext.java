package SpringMVC.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import SpringMVC.Bean.Address;
import SpringMVC.Bean.User;
import SpringMVC.Service.UserService;
import SpringMVC.Service.UserServiceImpl;
import SpringMVC.dao.Dao;
import SpringMVC.dao.DaoImpl;

@Configuration
public class AppContext {
	
	@Bean
	@Scope(value = ConfigurableBeanFactory.SCOPE_PROTOTYPE)
	public User getUser() {
		return new User();
	}

	@Bean
	@Scope(value = ConfigurableBeanFactory.SCOPE_PROTOTYPE)
	public Address getAddress() {
		return new Address();
	}
	@Bean
	public DaoImpl getDao() {
		return new DaoImpl();
	}
	@Bean
	public UserService getService() {
		return new UserServiceImpl();
	}
	@Bean
	public List getList() {
		return (List) new ArrayList<Address>();
	}

}
