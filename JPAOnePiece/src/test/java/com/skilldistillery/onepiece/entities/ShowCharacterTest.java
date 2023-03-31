package com.skilldistillery.onepiece.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ShowCharacterTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ShowCharacter showCharacter;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAOnePiece");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		showCharacter = em.find(ShowCharacter.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		
	}

	@Test
	void test() {
		assertNotNull(showCharacter);
		assertEquals("Luffy", showCharacter.getFirstName());
	}

}
