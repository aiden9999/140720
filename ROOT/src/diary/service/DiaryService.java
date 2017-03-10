package diary.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class DiaryService {
	@Autowired
	SqlSessionFactory fac;

	// ���̾ ���� ����Ʈ
	public List<HashMap> diary(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("diary.diary", 0);
		ss.close();
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			String date = m.get("day").toString();
			String year = date.substring(0, 4);
			String month = date.substring(date.indexOf("-")+1, date.lastIndexOf("-"));
			if(month.length()==1){
				month = "0"+month;
			}
			String day = date.substring(date.lastIndexOf("-")+1);
			date = year+"."+month+"."+day;
			m.put("day", date);
			list.set(i, m);
		}
		return list;
	}
	
	// ����Ʈ ������
	public int page(){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("diary.page");
		n = n%10==0 ? n/10 : n/10+1;
		ss.close();
		return n;
	}
	
	// �� ����
	public boolean modify(int num, String title, String content) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("num", num);
		map.put("title", title);
		map.put("content", content);
		int n = ss.update("diary.modify", map);
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

	// �� ���
	public boolean write(String title, String content, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", ((HashMap)session.getAttribute("login")).get("id").toString());
		map.put("nick", ((HashMap)session.getAttribute("login")).get("nick").toString());
		try{
			ss.insert("diary.write", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// �� ����
	public boolean remove(int num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("diary.remove", num);
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

	// ������ �̵�
	public List<HashMap> selectPage(int num) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("diary.diary", (num-1)*10);
		ss.close();
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			String date = m.get("day").toString();
			String year = date.substring(0, 4);
			String month = date.substring(date.indexOf("-")+1, date.lastIndexOf("-"));
			if(month.length()==1){
				month = "0"+month;
			}
			String day = date.substring(date.lastIndexOf("-")+1);
			date = year+"."+month+"."+day;
			m.put("day", date);
			list.set(i, m);
		}
		return list;
	}

	// �� ����
	public HashMap view(int num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("diary.view", num);
		ss.close();
		return map;
	}
}
