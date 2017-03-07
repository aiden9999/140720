package main.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MainService {
	
	@Autowired
	SqlSessionFactory fac;
	
	// ·Î±×ÀÎ
	public void login(String id, String pw, HttpSession session){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		List<HashMap> list = ss.selectList("member.login", map);
		ss.close();
		if(list.size()>0){
			session.setAttribute("login", list.get(0));
		}
	}
}
