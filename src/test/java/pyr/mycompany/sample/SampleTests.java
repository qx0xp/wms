package pyr.mycompany.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import pyr.mycompany.controller.HomeController;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class SampleTests {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private Restrant restaurant;
	
	@Test
	public void testExist() {
		assertNotNull(restaurant);
		
		logger.info("restaurant= "+restaurant);
		logger.info("---------------");
		logger.info("restaurant.getChef()= "+restaurant.getChef());
	}
	
}
