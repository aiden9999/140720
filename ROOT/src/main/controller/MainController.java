package main.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/")
public class MainController {

	// 인트로
	@RequestMapping("/")
	public String intro(){
		return "/main/intro.jsp";
	}
	
	// 인덱스
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView("/main/index.jsp");
		return mav;
	}
}
