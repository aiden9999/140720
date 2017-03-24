package picture.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import picture.service.*;

@Controller
@RequestMapping("/picture")
public class PictureController {
	@Autowired
	PictureService ps;
	
	// picture
	@RequestMapping("")
	public ModelAndView picture(){
		ModelAndView mav = new ModelAndView("/menu/picture/picture.jsp");
		return mav;
	}
}
