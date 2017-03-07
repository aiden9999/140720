package schedule.controller;

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
	public int add(@PathVariable(name="day")String day, @PathVariable(name="schedule")String schedule){
		return ss.add(day, schedule);
	}
}
