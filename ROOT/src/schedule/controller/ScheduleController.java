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
	
	// ������ ����
	@RequestMapping("/add/{day}/{schedule}")
	@ResponseBody
	public boolean add(@PathVariable(name="day")String day, @PathVariable(name="schedule")String schedule){
		return ss.add(day, schedule);
	}
	
	// ������ ������
	@RequestMapping("/schedule/{month}")
	@ResponseBody
	public List<HashMap> schedule(@PathVariable(name="month")int month){
		return ss.schedule(month);
	}
	
	// ������ ����
	@RequestMapping("/remove/{day}/{schedule}")
	@ResponseBody
	public boolean remove(@PathVariable(name="day")String day, @PathVariable(name="schedule")String schedule){
		return ss.remove(day, schedule);
	}
}
