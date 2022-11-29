package pyr.mycompany.persistence;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import pyr.mycompany.mapper.TimeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class TimeMapperTests {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void testGetTime() {
		
		logger.info("클래스이름= "+timeMapper.getClass().getName());
		logger.info("-TimeMapper에 있는 select결과= "+timeMapper.getTime());
	}
}
