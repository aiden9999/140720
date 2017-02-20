package main.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class MainController {

	// ¿Œ∆Æ∑Œ
	@RequestMapping("/")
	public String intro(){
		return "/main/intro.jsp";
	}
}
