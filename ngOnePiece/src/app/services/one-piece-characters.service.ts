import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { OnePiece } from '../models/one-piece';

@Injectable({
  providedIn: 'root'
})
export class OnePieceCharactersService {

  baseUrl = "http://localhost:8085/"
  private url = this.baseUrl + "api/characters"

  constructor(
    private http: HttpClient
  ) { }

  index(): Observable<OnePiece[]> {
    return this.http.get<OnePiece[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('PokemonService.index(): error retrieving One Piece Characters: ' + err)
        );
      })
    );
  }
}
