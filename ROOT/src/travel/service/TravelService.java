package travel.service;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class TravelService {
	@Autowired
	SqlSessionFactory fac;
	
	
}
