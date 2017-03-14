package movie.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.client.*;

@Component
public class MovieService {
	@Autowired
	SqlSessionFactory fac;

	// 영화 정보
	public LinkedHashMap movie(int movieCd){
		RestTemplate rt = new RestTemplate();
		String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo?key=161f78de5eda148d75771f8d3a8d1cdb&movieCd="+movieCd;
		LinkedHashMap map = rt.getForObject(url, LinkedHashMap.class);
		LinkedHashMap movie = (LinkedHashMap)((LinkedHashMap)map.get("movieInfoResult")).get("movieInfo");
		return movie;
	}
	
	// 영화 데이터 저장
	public void saveMovie(LinkedHashMap movie){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("movie.list");
		int check = 0;
		if(list.size()>0){
			for(HashMap m : list){
				if(m.get("num").toString().equals(movie.get("movieCd").toString())){
					check++;
				}
			}
			if(check==0){
				addMovie(movie, ss);
			} else {
				ss.rollback();
				ss.close();
			}
		} else {
			addMovie(movie, ss);
		}
	}
	
	// 영화 데이터 저장 내부 메서드
	public void addMovie(LinkedHashMap movie, SqlSession ss){
		try{
			LinkedHashMap map = movie(Integer.parseInt(movie.get("movieCd").toString()));
			map.put("num", map.get("movieCd"));
			map.put("title", map.get("movieNm"));
			map.put("open", map.get("openDt"));
			map.put("running", map.get("showTm"));
			ArrayList<LinkedHashMap> li = (ArrayList)map.get("genres");
			String genre = "";
			for(int i=0; i<li.size(); i++){
				genre += li.get(i).get("genreNm");
				if(i!=li.size()-1){
					genre += ",";
				}
			}
			map.put("genre", genre);
			map.put("grade", ((LinkedHashMap)((ArrayList)map.get("audits")).get(0)).get("watchGradeNm"));
			map.put("director", ((LinkedHashMap)((ArrayList)map.get("directors")).get(0)).get("peopleNm"));
			ArrayList<LinkedHashMap> li2 = (ArrayList)map.get("actors");
			String actor = "";
			for(int i=0; i<li2.size(); i++){
				actor += li2.get(i).get("peopleNm");
				if(i!=li2.size()-1){
					actor += ",";
				}
			}
			map.put("actor", actor);
			map.put("company", ((LinkedHashMap)((ArrayList)map.get("companys")).get(0)).get("companyNm"));
			ss.insert("movie.add", map);
			ss.commit();
			ss.close();
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
		}
	}
}
