package diary.controller;

import java.util.*;

import javax.servlet.http.*;

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
	
	// ���̾ ����
	@RequestMapping("")
	public ModelAndView diary(){
		ModelAndView mav = new ModelAndView("/menu/diary/diary.jsp");
		List<HashMap> diary = ds.diary();
		mav.addObject("diary", diary);
		int page = ds.page();
		mav.addObject("page", page);
		if(diary.size()>0){
			mav.addObject("view", diary.get(0));
		}
		int start = 1;
		int end = start+4>page ? start+4 : page;
		mav.addObject("start", start);
		mav.addObject("end", end);
		return mav;
	}
	
	// ����
	@RequestMapping("/modify/{num}/{title}/{content}")
	@ResponseBody
	public boolean modify(@PathVariable(name="num")int num, @PathVariable(name="title")String title,
										@PathVariable(name="content")String content){
		return ds.modify(num, title, content);
	}
	
	// �� ���
	@RequestMapping("/write/{title}/{content}")
	@ResponseBody
	public boolean write(@PathVariable(name="title")String title, @PathVariable(name="content")String content, HttpSession session){
		return ds.write(title, content, session);
	}
	
	// �� ����
	@RequestMapping("/remove/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="num")int num){
		return ds.remove(num);
	}
	
	// ������ �̵�
	@RequestMapping("/page/{num}")
	@ResponseBody
	public ModelAndView page(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/menu/diary/listAjax.jsp");
		mav.addObject("diary", ds.selectPage(num));
		return mav;
	}
	
	// ������ ����, ����
	@RequestMapping("/page/{num}/{arrow}")
	@ResponseBody
	public ModelAndView page2(@PathVariable(name="num")int num, @PathVariable(name="arrow")String arrow){
		ModelAndView mav = new ModelAndView("/menu/diary/pageAjax.jsp");
		int page = ds.page();
		mav.addObject("start", num);
		mav.addObject("end", (num+4)>page ? page : (num+4));
		mav.addObject("page", page);
		return mav;
	}
	
	// �� ����
	@RequestMapping("/view/{num}")
	@ResponseBody
	public HashMap view(@PathVariable(name="num")int num){
		return ds.view(num);
	}
}
