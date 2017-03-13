package movie.service;

import java.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.client.*;

@Component
public class MovieService {

	// 영화 정보
	public LinkedHashMap movie(int movieCd){
		RestTemplate rt = new RestTemplate();
		String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo?key=161f78de5eda148d75771f8d3a8d1cdb&movieCd="+movieCd;
		LinkedHashMap map = rt.getForObject(url, LinkedHashMap.class);
		LinkedHashMap movie = (LinkedHashMap)((LinkedHashMap)map.get("movieInfoResult")).get("movieInfo");
		return movie;
	}
}
