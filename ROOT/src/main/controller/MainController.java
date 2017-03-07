package main.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import main.service.*;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService ms;

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
	
	// 로그인
	@RequestMapping("/login/{id}/{pw}")
	public ModelAndView login(@PathVariable(name="id")String id, @PathVariable(name="pw")String pw, HttpSession session){
		ModelAndView mav = new ModelAndView("redirect:/index");
		ms.login(id, pw, session);
		return mav;
	}
}
