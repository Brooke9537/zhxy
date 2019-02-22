package qs.zhxy.controller;

import java.util.Map;



import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import qs.zhxy.pojo.User;

@Controller
public class IndexController{
	private Logger logger = Logger.getLogger(IndexController.class);
	
	@RequestMapping("/index")
	public String index(){
		//System.out.println("hello,SpringMVC!");
		logger.info("hello,SpringMVC!");
		return "index";
	}
	/*
	 * 参数传递：view to controller
	 */
	
/*	@RequestMapping("/welcome")
	public String welcome(String username){
		logger.info("welcome, " + username);
		return "index";
	}*/
	
	@RequestMapping("/welcome")
	public String welcome(@RequestParam(value="username",required=false) String username){
			logger.info("welcome," + username);
			return "index";
		}


	/*@RequestMapping(value="/welcome",method=RequestMethod.GET,params="username")
	public String welcome(String username){
		logger.info("welcome, " + username);
		return "index";
	}*/
	
	/**
	 * 参数传递：controller to view -(ModelAndView)
	 * @param username
	 * @return
	 */
	@RequestMapping("/index1")
	public ModelAndView index(String username){
		logger.info("welcome! username: " + username);
		ModelAndView mView = new ModelAndView();
		mView.addObject("username", username);
		mView.setViewName("index");
		return mView;
	}
	
	/**
	 * 参数传递：controller to view -(Model)
	 * @param username
	 * @param model
	 * @return
	 */
	@RequestMapping("/index2")
	public String index(String username,Model model){
		logger.info("hello,SpringMVC! username: " + username);
		model.addAttribute("username", username);
		/**
		 * 默认使用对象的类型作为key：
		 * model.addAttribute("string", username)
		 * model.addAttribute("user", new User())
		 */
		model.addAttribute(username);
		User user = new User();
		user.setUserName(username);
		model.addAttribute("currentUser", user);
		model.addAttribute(user);
		return "index";
	}
	
	/**
	 * 参数传递：controller to view -(Map<String,Object>)
	 * @param username
	 * @param model
	 * @return
	 */
	@RequestMapping("/index3")
	public String index(String username,Map<String, Object> model){
		logger.info("hello,SpringMVC! username: " + username);
		model.put("username", username);
		return "index";
	}
	
}
