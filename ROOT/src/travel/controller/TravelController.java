package travel.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import travel.service.*;

@Controller
@RequestMapping("/travel")
public class TravelController {
	@Autowired
	TravelService ts;
	
	// 여행 메인
	@RequestMapping("")
	public ModelAndView travel(){
		ModelAndView mav = new ModelAndView("/menu/travel/travel.jsp");
		return mav;
	}
}
