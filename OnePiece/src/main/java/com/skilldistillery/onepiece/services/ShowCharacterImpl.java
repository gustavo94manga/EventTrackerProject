package com.skilldistillery.onepiece.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.onepiece.entities.ShowCharacter;
import com.skilldistillery.onepiece.repositories.ShowCharacterRepository;

@Service
public class ShowCharacterImpl implements ShowCharacterService {

	@Autowired
	private ShowCharacterRepository charaRepo;
	
	@Override
	public List<ShowCharacter> listAllCharacters() {
		return charaRepo.findAll();
	}

	@Override
	public ShowCharacter getCharacter(int charaId) {
		return charaRepo.findById(charaId); 
	}

	@Override
	public ShowCharacter createCharacter(ShowCharacter chara) {
		ShowCharacter createCharacter = charaRepo.saveAndFlush(chara);
		return createCharacter;
	}

	@Override
	public ShowCharacter updateCharacter(int charaId, ShowCharacter chara) {
		ShowCharacter updateCharacter = charaRepo.findById(charaId);
		updateCharacter.setFirstName(chara.getFirstName());
		updateCharacter.setLastName(chara.getLastName());
		updateCharacter.setImageUrl(chara.getImageUrl());
		updateCharacter.setAge(chara.getAge());
		return charaRepo.saveAndFlush(updateCharacter);
	}

	@Override
	public boolean deleteCharacter(int charaId) {
		charaRepo.deleteById(charaId);
		return charaRepo.findById(charaId) == null;
	}

}
