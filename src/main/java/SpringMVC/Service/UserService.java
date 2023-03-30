package SpringMVC.Service;

import java.util.List;

import org.springframework.stereotype.Component;

import SpringMVC.Bean.User;

@Component
public interface UserService {

	boolean insertUser(User user);

	boolean userVaildate(String email, String password);

	User userGet(String email);

	List<User> getEmployees();

	boolean deleteEmployee(int id);
}
