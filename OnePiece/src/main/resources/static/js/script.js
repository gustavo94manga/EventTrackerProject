window.addEventListener('load', function(e) {
	console.log('script.js is loaded.');
	init();
});

function init() {
	console.log('in init()');
	/*loadAllCharacters();*/
	document.characterForm.lookup.addEventListener('click', function(event) {
		event.preventDefault();
		let charaId = document.characterForm.charaId.value;
		console.log(charaId);
		if (!isNaN(charaId) && charaId > 0) {
			getSingleCharacter(charaId);
		}
	});


	/*loadAllCharacters();*/
	document.allCharactersForm.allCharacters.addEventListener('click', function(event) {
		event.preventDefault();
		/*let charaId = document.allCharactersForm.charaId.value;
		console.log(charaId);*/
		/*if (!isNaN(charaId) && charaId > 0) {
			getSingleCharacter(charaId);
		}*/
		loadAllCharacters();
	});


	//Create Character
	document.newCharacterForm.addCharacterButton.addEventListener('click', function(e) {
		e.preventDefault();
		let form = document.newCharacterForm;

		let newCharacter = {
			firstName: form.firstName.value,
			lastName: form.lastName.value,
			imageUrl: form.imageUrl.value,
			age: form.age.value
		};
		console.log(newCharacter);
		addNewCharacter(newCharacter);
	});

	//Update Character
	document.updateCharacterForm.updateCharacterButton.addEventListener('click', function(e) {
		e.preventDefault();
		let form = document.updateCharacterForm;

		let updateCharacter = {
			firstName: form.firstName.value,
			lastName: form.lastName.value,
			age: form.age.value,
			imageUrl: form.imageUrl.value
		};

		let charaId = form.charaId.value;

		console.log(charaId + updateCharacter);
		updateACharacter(updateCharacter, charaId);
	});

	//Delete Character
	document.deleteCharacterForm.deleteCharacter.addEventListener('click', function(e) {
		e.preventDefault();
		let form = document.deleteCharacterForm;
		let charaId = form.charaId.value;
		deleteACharacter(charaId);
	});

}

function getSingleCharacter(charaId) {
	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/characters/' + charaId);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let characterJson = xhr.responseText;
				let singleCharacter = JSON.parse(characterJson);
				displaySingleCharacter(singleCharacter);
				//loadAllCharacters(charaId);
			}
			else {
				console.error('Request failed: ' + xhr.status);
				displayError('Film not found: ' + charaId);
			}
		}
	}
	xhr.send();
}

function displaySingleCharacter(singleCharacter) {
	let dataDiv = document.getElementById('characterData');
	dataDiv.textContent = '';
	// TODO:
	// * Create and append elements to the data div to display:
	// * Film title (h1) and description (blockquote).
	let h2 = document.createElement('h2');
	let h3 = document.createElement('h2');
	let ul = document.createElement('ul');
	let li = document.createElement('li');
	let li2 = document.createElement('li');
	h2.textContent = singleCharacter.firstName;
	h3.textContent = singleCharacter.lastName;

	li.textContent = "Age: " + singleCharacter.age;
	ul.appendChild(li);
	let image = document.createElement('img');
	image.src = singleCharacter.imageUrl;
	image.alt = singleCharacter.firstName + ' ' + singleCharacter.lastName;
	image.style.width = '100px';
	image.addEventListener('click', function() {
		window.open(singleCharacter.imageUrl);
	});
	li2.appendChild(image);
	li.appendChild(li2);


	dataDiv.appendChild(h2);
	dataDiv.appendChild(h3);
	dataDiv.appendChild(ul);
	// * Rating, release year, and length as an unordered list.
	//If the new film created also had actors, I could call the getFilmActors from here 
	//instead of on getFilm and
	//it would display the actors and the new film created as well.
	// getFilmActors(filmId);
}

function loadAllCharacters() {
	//XHR stuff
	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/characters');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200) {
				let characterList = JSON.parse(xhr.responseText);
				displayCharacterList(characterList);
			}
		}
	};

	xhr.send();
}
// Have an else {} in the crud methods for status === code!!!!!!!!!

function displayCharacterList(characterList) {
	//DOM stuff
	let tbody = document.getElementById('characterListBody');
	tbody.textContent = '';
	for (let chara of characterList) {

		let tr = document.createElement('tr');
		tbody.appendChild(tr);

		/*	tr.addEventListener('click', function(e) {
				e.preventDefault();
				let characterId = e.target.parentElement.firstElementChild.textContent;
				console.log(characterId);
				getSingleCharacter(characterId);
			});*/

		let td = document.createElement('td');
		td.textContent = chara.id;
		tr.appendChild(td);

		td = document.createElement('td');
		td.textContent = chara.firstName;
		tr.appendChild(td);

		let td2 = document.createElement('td');
		td2.textContent = chara.lastName;
		tr.appendChild(td2);

		let td3 = document.createElement('td');
		td3.textContent = chara.age;
		tr.appendChild(td3);

		let td4 = document.createElement('td');
		let image = document.createElement('img');
		image.src = chara.imageUrl;
		image.alt = chara.firstName + ' ' + chara.lastName;
		image.style.width = '100px';
		image.addEventListener('click', function() {
			window.open(chara.imageUrl);
		});
		td4.appendChild(image);
		tr.appendChild(td4);
		/*td4.textContent = chara.imageUrl;
		tr.appendChild(td4);*/
	}
}

function displayError(errorMsg) {
	let characterListDiv = document.getElementById('characterListDiv');
	characterListDiv.textContent = errorMsg;
	let dataDiv = document.getElementsByTagName('characterData');
	dataDiv.textContent = '';
}

function addNewCharacter(newCharacter) {
	let xhr = new XMLHttpRequest();
	xhr.open('POST', 'api/characters');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200 || xhr.status === 201) {
				let chara = JSON.parse(xhr.responseText);
				loadAllCharacters();
				/*displaySingleCharacter(chara);*/
			}
			else {
				console.error('POST Request failed: ' + xhr.status);
				displayError('Character not created: ' + xhr.status + " : " + xhr.responseText);
			}
		}
	}
	xhr.setRequestHeader("Content-type", "application/json");
	let newCharacterJson = JSON.stringify(newCharacter);
	xhr.send(newCharacterJson);
}

function updateACharacter(updateCharacter, charaId) {
	let xhr = new XMLHttpRequest();
	xhr.open('PUT', 'api/characters/' + charaId);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			if (xhr.status === 200 || xhr.status === 201) {
				let chara = JSON.parse(xhr.responseText);
				console.log(chara);
				/*loadAllCharacters();*/
				displaySingleCharacter(chara);
			}
			else {
				console.error('PUT Request failed: ' + xhr.status);
				displayError('Character not updated: ' + xhr.status + " : " + xhr.responseText);
			}
		}
	}
	xhr.setRequestHeader("Content-type", "application/json");
	let updateCharacterJson = JSON.stringify(updateCharacter);
	xhr.send(updateCharacterJson);
}

function deleteACharacter(charaId) {
	let xhr = new XMLHttpRequest();
	/*xhr.open('DELETE', `characters/${charaId}`, true);*/
	xhr.open('DELETE', 'api/characters/' + charaId, true);
	xhr.onreadystatechange = function() {
		if (xhr.status === 204 && xhr.readyState === 4) {
			/*loadAllCharacters();*/
			console.log("Delete Successful");
		} else {
			console.log('Delete Unsuccessful');
		}
	};
	xhr.send();
}






