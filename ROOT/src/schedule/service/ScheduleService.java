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
	public boolean add(String day, String schedule){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("day", day);
		map.put("schedule", schedule);
		try{
			ss.insert("schedule.add", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	// 스케줄 리스트
	public List<HashMap> schedule(int month){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("schedule.schedule");
		List<HashMap> sch = new Vector<>();
		for(HashMap m : list){
			String day = m.get("day").toString();
			String schMonth = day.substring(day.indexOf("년")+2, day.indexOf("월"));
			if(schMonth.equals(Integer.toString(month))){
				sch.add(m);
			}
		}
		ss.close();
		return sch;
	}

	// 스케줄 삭제
	public boolean remove(String day, String schedule) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("day", day);
		map.put("schedule", schedule);
		int n = ss.delete("schedule.remove", map);
		if(n>0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
}
