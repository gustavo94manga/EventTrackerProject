import { OnePiece } from 'src/app/models/one-piece';
import { OnePieceCharactersService } from './../../services/one-piece-characters.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{

  onePieceCharacters: OnePiece[] = [];
  constructor(
    private onePieceService: OnePieceCharactersService
  ){}

  ngOnInit(): void {
    this.reload();
  }

  reload() {
    this.onePieceService.index().subscribe({
      next: (data) => {
        this.onePieceCharacters = data;
      },
      error: (fail) => {
        //TODO: log fail
      }
    })
  }
}
