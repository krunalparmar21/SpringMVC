package SpringMVC.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import SpringMVC.Bean.Address;
import SpringMVC.Bean.User;
import SpringMVC.Service.UserService;
import SpringMVC.Service.UserServiceImpl;

@Controller
public class HomeController {

	private UserService userService;
	private User user;
	private UserServiceImpl serviceObject = new UserServiceImpl();
	private HttpSession session;

	@RequestMapping(value = { "/", "index" })
	public String handleRequest(Model model) {
		return "index";
	}

	@RequestMapping("/Forgotpassword")
	public String getForgotPage() {
		return "Forgotpassword";
	}

	@RequestMapping("/Registration")
	public String getRegisterPage(Model model) {
		model.addAttribute("userObject", new User());
		return "Registration";
	}

	@RequestMapping(value = "/SaveUser", method = RequestMethod.POST)
	public String insertNewUser(@ModelAttribute("user") User userObject, HttpServletRequest request) {

		session = request.getSession();
		User user=(User)session.getAttribute("sessionUser");
		System.out.println("user" + userObject);
		if(userObject.getImagebyte().length != 0) {
			System.out.println("\n=> Image selected");
		}
		else {
			byte[] imageByte=(byte[]) session.getAttribute("editUserImage");
			session.removeAttribute("editUserImage");
			userObject.setImagebyte(imageByte);
			System.out.println("\n=> Image not selected, So old image selected default.");
		}
		serviceObject.insertUser(userObject);
		// check form id and session user id is same than we update the session for profile page.
		if(user != null) {
			if(user.getId() == user.getId()) {
				User sessionUser = serviceObject.userGet(user.getEmail());
				session.setAttribute("sessionUser", sessionUser);
			}
		}
		return "index";
	}
	
	@RequestMapping("/EditProfile")
	public String getEditProfilePage(@RequestParam("email") String email, Model model, HttpServletRequest request) {
		System.out.println("User id for edit is : " + email);
		User userData = serviceObject.userGet(email);
		System.out.println("user data in edit: " + userData);
		session = request.getSession();
		session.setAttribute("editUserImage", userData.getImagebyte());
		model.addAttribute("userObject", userData);
		return "Registration";
	}

	@RequestMapping(value = "/LoginController")
	public String LoginController(@RequestParam("email") String email, @RequestParam("password") String password,
		Model model, HttpServletRequest request) {
		System.out.println("Process For Login");
		
		if (serviceObject.userVaildate(email, password)) {
			session = request.getSession();
			User sessionUser = serviceObject.userGet(email);
			session.setAttribute("sessionUser", sessionUser);
			if (sessionUser.getStatus() == 0) {
				return "redirect:/ViewProfile";
			} else {
				return "redirect:/admin_index";
			}

		} else {
			model.addAttribute("loginError", "Please enter Valid credentials.");
			return "index";
		}
	}
	
	@RequestMapping("/Logout")
	public String logout(HttpServletRequest request) {

		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:/index";		
	}
	
	@RequestMapping("/ViewEmployee")
	public String getViewUserPage(Model model) {

		List<User> userData = serviceObject.getEmployees();
		System.out.println("users are : " + userData.size());
		model.addAttribute("UserDataList", userData);
		return "viewemployee";
	}
	
	@RequestMapping("/DeleteEmployee")
	@ResponseBody
	public String deleteEmployee(@RequestParam("id") int id) {
		System.out.println(id);
		serviceObject.deleteEmployee(id);
		return "viewemployee";
	}
	
	@RequestMapping("/ViewProfile")
	public String getProfilePage(Model model, HttpServletRequest request) {
		model.addAttribute("profileUser", new User());
		session = request.getSession();
		User user = (User) session.getAttribute("sessionUser");
		System.out.println(user);
		return "viewprofile";
	}


	@RequestMapping("/admin_index")
	public String getAdminIndex(Model model) {
		model.addAttribute("userObj", new User());
		return "admin_index";
	}
	
	@RequestMapping("/user_home")
	public String getUserHome(Model model) {
		model.addAttribute("userObj", new User());
		return "user_home";
	}
}
