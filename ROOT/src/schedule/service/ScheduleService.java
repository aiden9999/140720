package schedule.service;

import java.text.*;
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
	
	// 스케줄 리스트
	public List<HashMap> schedule(){
		SqlSession ss = fac.openSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 dd일");
		String today = sdf.format(System.currentTimeMillis());
		String month = today.substring(today.indexOf("년")+2, today.indexOf("월"));
		List<HashMap> list = ss.selectList("schedule.schedule");
		List<HashMap> sch = new Vector<>();
		for(HashMap m : list){
			String day = m.get("day").toString();
			String schMonth = day.substring(day.indexOf("년")+2, day.indexOf("월"));
			if(schMonth.equals(month)){
				sch.add(m);
			}
		}
		ss.close();
		return sch;
	}
}
