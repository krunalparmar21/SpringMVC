package SpringMVC.dao;

import java.util.List;

import SpringMVC.Bean.User;

public interface Dao {


	boolean insertUser(User user);
	boolean userVaildate(String email, String password);
	User userGet(String email);
	List<User> getEmployees();
	boolean deleteEmployee(int id); 
}
