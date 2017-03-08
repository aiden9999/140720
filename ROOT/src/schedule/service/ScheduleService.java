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
	
	// ������ ����
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
	
	// ������ ����Ʈ
	public List<HashMap> schedule(){
		SqlSession ss = fac.openSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� M�� dd��");
		String today = sdf.format(System.currentTimeMillis());
		String month = today.substring(today.indexOf("��")+2, today.indexOf("��"));
		List<HashMap> list = ss.selectList("schedule.schedule");
		List<HashMap> sch = new Vector<>();
		for(HashMap m : list){
			String day = m.get("day").toString();
			String schMonth = day.substring(day.indexOf("��")+2, day.indexOf("��"));
			if(schMonth.equals(month)){
				sch.add(m);
			}
		}
		ss.close();
		return sch;
	}
}
