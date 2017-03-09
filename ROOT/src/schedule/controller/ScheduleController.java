package schedule.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import schedule.service.*;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	ScheduleService ss;
	
	// 스케줄 저장
	@RequestMapping("/add/{day}/{schedule}")
	@ResponseBody
	public boolean add(@PathVariable(name="day")String day, @PathVariable(name="schedule")String schedule){
		return ss.add(day, schedule);
	}
	
	// 스케줄 데이터
	@RequestMapping("/schedule/{month}")
	@ResponseBody
	public List<HashMap> schedule(@PathVariable(name="month")int month){
		return ss.schedule(month);
	}
	
	// 스케줄 삭제
	@RequestMapping("/remove/{day}/{schedule}")
	@ResponseBody
	public boolean remove(@PathVariable(name="day")String day, @PathVariable(name="schedule")String schedule){
		return ss.remove(day, schedule);
	}
}
