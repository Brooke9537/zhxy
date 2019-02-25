package qs.zhxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController{
	
	/*
	 * 参数传递：view to controller
	 */
	
	@RequestMapping("/login")
	public String login(@RequestParam(value="username",required=false) String username){
			return "login";
	}


	/*@RequestMapping(value="/welcome",method=RequestMethod.GET,params="username")
	public String welcome(String username){
		logger.info("welcome, " + username);
		return "index";
	}*/
	
	
}
