package com.skilldistillery.onepiece;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.skilldistillery.onepiece.entities.ShowCharacter;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
class OnePieceApplicationTests {
	
	private static String url = "/api/characters";
	
	@Autowired
	private TestRestTemplate restTest;
	
	@Test
	public void test_ListOfCharacters() {
		@SuppressWarnings("rawtypes")
		ResponseEntity<List> entity = restTest.getForEntity(url, List.class);
		assertEquals(HttpStatus.OK, entity.getStatusCode());
		@SuppressWarnings("unchecked")
		List<ShowCharacter> showCharacters = (List<ShowCharacter>)entity.getBody();
		assertTrue(showCharacters.size() > 0);
	}
	
	@Test
	public void get_SingleCharacter() {
		int charaId = 1;
		ResponseEntity<ShowCharacter> entity = restTest.getForEntity(url + "/" + charaId, ShowCharacter.class);
		assertEquals(HttpStatus.OK, entity.getStatusCode());
		ShowCharacter singleCharacter = (ShowCharacter)entity.getBody();
		assertNotNull(singleCharacter);
		assertEquals("Luffy", singleCharacter.getFirstName());
	}
	
	@Test
	public void test_film_create() {
		ShowCharacter create = new ShowCharacter();
		create.setFirstName("NEW TEST CHARACTER " + Math.random()); // Name is unique
//		Language lang = new Language();
		create.setId(create.getId());
//        	newFilm.setLanguage(lang);
		ResponseEntity<ShowCharacter> entity = restTest.postForEntity(url, create, ShowCharacter.class);
		assertEquals(HttpStatus.CREATED, entity.getStatusCode());
		ShowCharacter showCharacter = (ShowCharacter)entity.getBody();
		assertNotNull(showCharacter);
	}
	
	@Test
	public void test_film_delete() {
		ShowCharacter newCharacter = new ShowCharacter();
		newCharacter.setFirstName("NEW CHARACTER TO DELETE");
//		Language lang = new Language();
//		lang.setId(1);
		newCharacter.setId(3);
		ResponseEntity<ShowCharacter> entity = restTest.postForEntity(url, newCharacter, ShowCharacter.class);
		assertEquals(HttpStatus.CREATED, entity.getStatusCode());
		ShowCharacter showCharacter = (ShowCharacter)entity.getBody();
		assertNotNull(showCharacter);
		int idToDelete = showCharacter.getId();
		restTest.delete(url + "/" + idToDelete);
		assertEquals(HttpStatus.OK,restTest.getForEntity(url + "/" + idToDelete, ShowCharacter.class).getStatusCode());
	}

}
