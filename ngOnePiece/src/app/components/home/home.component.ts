import { OnePiece } from 'src/app/models/one-piece';
import { OnePieceCharactersService } from './../../services/one-piece-characters.service';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{


  selected: OnePiece | null = null;
  newCharacter: OnePiece = new OnePiece();
  editCharacter: OnePiece | null = null;
  onePieceCharacters: OnePiece[] = [];



  constructor(
    private onePieceService: OnePieceCharactersService,
    private route: ActivatedRoute,
    private router: Router
  ){}

  ngOnInit(): void {
    let charaIdString = this.route.snapshot.paramMap.get('charaId');
    if (charaIdString) {
      console.log('ngOnInit: charaId: ' + charaIdString);
      let charaId = parseInt(charaIdString);
      console.log(charaId);
      if(isNaN(charaId)) {
        this.router.navigateByUrl('invalid');
      }
      else {
        this.onePieceService.show(charaId).subscribe({
          next: (chara) => {
            this.selected = chara;
          },
          error: (fail) => {
            this.router.navigateByUrl('CharacterNotFound')
          }
        })
      }
    }
    this.reload();
  }

getCharacterCount() {
}

getCharacterStyle(): string {
return "";
}

displayOnePieceCharacter(chara: OnePiece) {
  this.selected = chara;
}

displayTable() {
  this.selected = null;
}

addOnePieceCharacter(chara: OnePiece): void {
  this.onePieceService.create(chara).subscribe({
    next: (result) => {
      this.newCharacter = new OnePiece();
      this.reload();
    },
    error: (failure) => {
      console.error('Error creating Character');
      console.error(failure);
    }
  });
}

setEditOnePieceCharacter() {
  this.editCharacter = Object.assign({}, this.selected);
}

updateOnePieceCharacter(chara: OnePiece, goToDetail = true) {
  console.log(chara);

  this.onePieceService.update(chara).subscribe({
    next: (updateOnePieceCharacter) => {
      this.editCharacter = null;
      if(goToDetail) {
      this.selected = updateOnePieceCharacter;
      }
      this.reload();
    },
    error: (failure) => {
      console.error('Error updating Character');
      console.error(failure);
    }
  });
}

deleteOnePieceCharacter(charaId: number) {
  this.onePieceService.destroy(charaId).subscribe({
    next: (result) => {
      this.reload();
    },
    error: (failure) => {
      console.error('Error deleting Todo');
      console.error(failure);
    }
  });
}

reload() {
    this.onePieceService.index().subscribe({
      next: (data) => {
        this.onePieceCharacters = data;
      },
      error: (fail) => {
        //TODO: log fail
        console.error('Error getting One Piece Characters from Service')
      }
    })
  }
}
