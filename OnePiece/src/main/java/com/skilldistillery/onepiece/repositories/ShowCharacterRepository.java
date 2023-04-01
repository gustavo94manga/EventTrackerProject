package com.skilldistillery.onepiece.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.onepiece.entities.ShowCharacter;

public interface ShowCharacterRepository extends JpaRepository<ShowCharacter, Integer> {

	ShowCharacter findById(int charaId);
}
