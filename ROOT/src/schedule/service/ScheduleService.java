package schedule.service;

import java.util.*;

import org.apache.ibatis.exceptions.*;
import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class ScheduleService {
	@Autowired
	SqlSessionFactory fac;
	
	// 스케줄 저장
	public int add(String day, String schedule){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("day", day);
		map.put("schedule", schedule);
		try{
			ss.insert("schedule.add", map);
			ss.commit();
			ss.close();
			return 0;
		} catch(PersistenceException e){
			ss.rollback();
			ss.close();
			return 1;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return 2;
		}
	}
}
