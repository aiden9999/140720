package main.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import main.service.*;
import schedule.service.*;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService ms;
	@Autowired
	ScheduleService ss;

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
	@ResponseBody
	public boolean login(@PathVariable(name="id")String id, @PathVariable(name="pw")String pw, HttpSession session){
		return ms.login(id, pw, session);
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		ms.logout(session);
		return "redirect:/index";
	}
}
