package com.skilldistillery.onepiece;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
class OnePieceApplicationTests {
	
	private static String url = "/api/characters";
	
	@Autowired
	private TestRestTemplate restTest;
	
	@Test
	public void test_ListOfCharacters() {
	}

}
