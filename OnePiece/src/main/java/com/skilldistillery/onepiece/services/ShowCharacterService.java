package com.skilldistillery.onepiece.services;

import java.util.List;

import com.skilldistillery.onepiece.entities.ShowCharacter;

public interface ShowCharacterService {

	List<ShowCharacter> listAllCharacters();
	ShowCharacter getCharacter(int charaId);
	ShowCharacter createCharacter(ShowCharacter chara);
	ShowCharacter updateCharacter(int charaId, ShowCharacter chara);
	boolean deleteCharacter(int charaId);
	
}
