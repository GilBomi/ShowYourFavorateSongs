package net.skhu.controller;



import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.skhu.SendEmailSSL;
import net.skhu.TempAuth_key;
import net.skhu.domain.User;
import net.skhu.repository.UserRepository;

@Controller
@RequestMapping("/page")
public class APIController {

	@Autowired
	UserRepository userRepositroy;

	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(Model model) {
		List<User> users=userRepositroy.findAll();
		model.addAttribute("users", users);
		// System.out.println("갯수:"+users.size());
		return "page/join";
	}
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join2(Model model,User user){
		String auth_key = new TempAuth_key().getKey(45, false);
		SendEmailSSL es=new SendEmailSSL();
		//		if(userRepositroy.findByEmail(user.getEmail())==null &&userRepositroy.findByNickname(user.getNickname())==null) {
		userRepositroy.save(new User(user.getEmail(),user.getPassword(),user.getNickname(),null,auth_key,false,false));
		es.sendEmail(user.getEmail(),auth_key); // 받는 사람 이메일
		return "redirect:joinNext";
	}
	@RequestMapping(value="joinNext", method=RequestMethod.GET)
	public String edit(Model model) {
		int max= userRepositroy.findMaxUser_idx();
		Optional<User> optinalEntity =  userRepositroy.findById(max);
		User user = optinalEntity.get();
		model.addAttribute("user", user);
		return "page/joinNext";
	}
	@RequestMapping(value="join_success", method=RequestMethod.GET)
	public String join_success(Model model,@RequestParam("auth_key") String auth_key){
		User user=userRepositroy.findByAuth_key(auth_key);
		userRepositroy.updateAuth_key(user.getEmail());
		return "page/join_success";
	}


	@RequestMapping(value="findPw", method=RequestMethod.GET)
	public String findPw(Model model, User user) {
		List<User> users=userRepositroy.findAll();
		model.addAttribute("users", users);
		return "page/findPw";
	}
	@RequestMapping(value="findPw", method=RequestMethod.POST)
	public String findPw2(Model model,@RequestParam("email") String email) {
		User user=userRepositroy.findByEmail(email);
		SendEmailSSL es=new SendEmailSSL();
		//		if(userRepositroy.findByEmail(user.getEmail())==null &&userRepositroy.findByNickname(user.getNickname())==null) {
		es.sendPwChange(user.getEmail(), user.getAuth_key());
		return "redirect:findPwNext";
	}
	@RequestMapping(value="changePw", method=RequestMethod.GET)
	public String changePw(Model model,@RequestParam("auth_key") String auth_key) {
		return "page/changePw";
	}
	@RequestMapping(value="changePw", method=RequestMethod.POST)
	public String changePw2(Model model,@RequestParam("auth_key") String auth_key,@RequestParam("password") String password) {
		User user=userRepositroy.findByAuth_key(auth_key);
		userRepositroy.updatePassword(user.getEmail(),password);
		return "redirect:changePwNext";
	}

	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(Model model) {
		List<User> users=userRepositroy.findAll();
		model.addAttribute("users", users);
		return "page/login";
	}
	@RequestMapping(value="login", method=RequestMethod.POST)
	public ModelAndView login2(@Valid User user, BindingResult bindingResult,
			HttpSession session, HttpServletResponse response) throws Exception {
		if(bindingResult.hasErrors()) {
			ModelAndView mv = new ModelAndView("page/login");
			return mv;
		}
		User user2=userRepositroy.findByEmail(user.getEmail());
		session.setAttribute("user", user2);

		Cookie rememberCookie = new Cookie("REMEMBER", user2.getEmail());
		rememberCookie.setPath("/");
		response.addCookie(rememberCookie);
		ModelAndView mv = new ModelAndView("page/home");
		return mv;

	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public ModelAndView logtout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:home");
		return mv;
	}

	//	@RequestMapping(value="example", method=RequestMethod.GET)
	//	public String example() {
	//		return "page/example";
	//	}
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String list() {
		return "page/home";
	}
	@RequestMapping(value="changePwNext", method=RequestMethod.GET)
	public String changePwNext() {
		return "page/changePwNext";
	}
	@RequestMapping(value="searchingSong", method=RequestMethod.GET)
	public String searching() {
		return "page/searchingSong";
	}
	@RequestMapping(value="user", method=RequestMethod.GET)
	public String user() {
		return "page/user";
	}

	@RequestMapping(value="map", method=RequestMethod.GET)
	public String map() {
		return "page/map";
	}
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public String notice() {
		return "page/notice";
	}
	@RequestMapping(value="chartBoard", method=RequestMethod.GET)
	public String chartBoard() {
		return "page/chartBoard";
	}
	@RequestMapping(value="bestBoard", method=RequestMethod.GET)
	public String bestBoard() {
		return "page/bestBoard";
	}
	@RequestMapping(value="freeBoard", method=RequestMethod.GET)
	public String freeBoard() {
		return "page/freeBoard";
	}
	@RequestMapping(value="tipBoard", method=RequestMethod.GET)
	public String tipBoard() {
		return "page/tipBoard";
	}
	@RequestMapping(value="recommendBoard", method=RequestMethod.GET)
	public String recommendBoard() {
		return "page/recommendBoard";
	}
	@RequestMapping(value="boastBoard", method=RequestMethod.GET)
	public String boastBoard() {
		return "page/boastBoard";
	}
	@RequestMapping(value="relative", method=RequestMethod.GET)
	public String relative() {
		return "page/relative";
	}
	@RequestMapping(value="findId", method=RequestMethod.GET)
	public String findId() {
		return "page/findId";
	}

	@RequestMapping(value="findIdNext", method=RequestMethod.GET)
	public String findIdNext() {
		return "page/findIdNext";
	}
	@RequestMapping(value="findPwNext", method=RequestMethod.GET)
	public String findPwNext() {
		return "page/findPwNext";
	}

	@RequestMapping(value="postWrite", method=RequestMethod.GET)
	public String postWrite() {
		return "page/postWrite";
	}


}
