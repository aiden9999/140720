package movie.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import movie.service.*;

@Controller
@RequestMapping("/movie")
public class MovieController {
	@Autowired
	MovieService ms;
	
	// 영화 정보
	@RequestMapping("/{movieCd}/{num}")
	public ModelAndView movie(@PathVariable(name="movieCd")int movieCd, @PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/menu/culture/movieDetail.jsp");
		LinkedHashMap movie = ms.movie(movieCd);
		mav.addObject("movie", movie);
		mav.addObject("num", num);
		return mav;
	}
}
