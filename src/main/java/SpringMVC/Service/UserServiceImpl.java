package SpringMVC.Service;


import java.util.List;

import SpringMVC.Bean.User;
import SpringMVC.dao.Dao;
import SpringMVC.dao.DaoImpl;


public class UserServiceImpl implements UserService {

    
    Dao daoObject = new DaoImpl();

    @Override
	public boolean insertUser(User user) {
		return daoObject.insertUser(user);
	}


	public boolean userVaildate(String email, String password) {
		return daoObject.userVaildate(email, password);
	}
	
	public User userGet(String email) {
		return daoObject.userGet(email);
	}
	
	public List<User> getEmployees() {
		return daoObject.getEmployees();
	}
	public boolean deleteEmployee(int id) {
		return daoObject.deleteEmployee(id);
	}
}
