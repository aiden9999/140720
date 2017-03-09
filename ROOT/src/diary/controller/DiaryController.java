package diary.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import diary.service.*;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	@Autowired
	DiaryService ds;
	
	// 다이어리 메인
	@RequestMapping("")
	public ModelAndView diary(){
		ModelAndView mav = new ModelAndView("/menu/diary/diary.jsp");
		return mav;
	}
}
