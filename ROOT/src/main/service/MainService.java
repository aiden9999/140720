package main.service;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.client.*;

import movie.service.*;

@Component
public class MainService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	MovieService ms;
	
	// 로그인
	public boolean login(String id, String pw, HttpSession session){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		List<HashMap> list = ss.selectList("member.login", map);
		ss.close();
		if(list.size()>0){
			session.setAttribute("login", list.get(0));
			return true;
		} else {
			return false;
		}
	}

	// 로그아웃
	public void logout(HttpSession session) {
		session.removeAttribute("login");
	}
	
	// 영화 순위
	public List<LinkedHashMap> movie(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String day = sdf.format(System.currentTimeMillis());
		day = Integer.toString(Integer.parseInt(day)-1);
		RestTemplate rt = new RestTemplate();
		String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList?key=161f78de5eda148d75771f8d3a8d1cdb&targetDt="+day;
		LinkedHashMap map = rt.getForObject(url, LinkedHashMap.class);
		List<LinkedHashMap> movie = (List<LinkedHashMap>) ((LinkedHashMap)map.get("boxOfficeResult")).get("dailyBoxOfficeList");
		for(LinkedHashMap m : movie){
			ms.saveMovie(m);
		}
		return movie;
	}
}
