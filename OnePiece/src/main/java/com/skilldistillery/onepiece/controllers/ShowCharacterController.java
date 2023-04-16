package com.skilldistillery.onepiece.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.onepiece.entities.ShowCharacter;
import com.skilldistillery.onepiece.services.ShowCharacterService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class ShowCharacterController {

	@Autowired
	private ShowCharacterService charaService;
	
	@GetMapping("characters")
	public List<ShowCharacter> getCharacterList() {
		return charaService.listAllCharacters();
	}
	
	@GetMapping("characters/{charaId}")
	public ShowCharacter getSingleCharacter(@PathVariable Integer charaId) {
		ShowCharacter showSingleCharacter = charaService.getCharacter(charaId);
		return showSingleCharacter;
	}
	@PostMapping("characters")
	public ShowCharacter createCharacter(@RequestBody ShowCharacter showcharacter,
			HttpServletRequest req, HttpServletResponse res) {
		ShowCharacter createdCharacter = null;
		try {
			createdCharacter = charaService.createCharacter(showcharacter);
			res.setStatus(201);
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(404);
		}
		return createdCharacter;
	}
	
	@PutMapping("characters/{charaId}")
	public ShowCharacter updateCharacter(@PathVariable Integer charaId, 
			@RequestBody ShowCharacter showCharacter, HttpServletResponse res) {
		ShowCharacter updatedCharacter = null;
		try {
			updatedCharacter = charaService.updateCharacter(charaId, showCharacter);
			res.setStatus(201);
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(404);
		}
		return updatedCharacter;
	}
	
	@DeleteMapping("characters/{charaId}")
	public boolean deleteCharacter(@PathVariable Integer charaId, HttpServletResponse res) {
		boolean deleted = false;
		try {
			deleted = charaService.deleteCharacter(charaId);
			if (deleted) {
			res.setStatus(204);
			} else {
				res.setStatus(404);
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(500);
		}
		return deleted;
	}
	
	
	
	
	
	
	
	
	
	
	
}
