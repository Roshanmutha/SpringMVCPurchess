package com.roshanonjava.spring;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class TransactionControllerTest {

	private MockMvc mockMvc;

	@Autowired
	private WebApplicationContext webApplicationContext;

	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext)
				.build();
	}

	@Test
	public void sayHello_ShouldRenderIndexView() throws Exception {
		mockMvc.perform(get("/transaction/newTransaction", 1L))
				.andExpect(status().is(200))
				.andExpect(view().name("lazyRowLoad"))
				.andExpect(forwardedUrl("/WEB-INF/views/lazyRowLoad.jsp"));
	}
	
/*	@Test
	public void loadCustomerTest() throws Exception {
		mockMvc.perform(get("/transaction/detail/90", 1L))
				.andExpect(status().is(200))
				.andExpect(view().name("transactionDetails")).andExpect(model().attributeExists("itemList")).andExpect(model().attribute("itemList", ""))
				.andExpect(forwardedUrl("/WEB-INF/views/transactionDetails.jsp"));
			
	}*/


}
