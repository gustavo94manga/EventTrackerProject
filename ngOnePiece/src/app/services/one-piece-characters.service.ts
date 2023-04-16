import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { OnePiece } from '../models/one-piece';
import { DatePipe } from '@angular/common';

@Injectable({
  providedIn: 'root'
})
export class OnePieceCharactersService {

  baseUrl = "http://localhost:8085/"
  private url = this.baseUrl + "api/characters"

  constructor(
    private http: HttpClient,
    private datePipe: DatePipe
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

  show(charaId: number): Observable<OnePiece> {
    return this.http.get<OnePiece>(this.url + "/" + charaId).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('onePieceService.show(): error retrieving Character: ' + err)
        );
      })
    );
  }

  create(chara: OnePiece): Observable<OnePiece> {
    chara.completed = false;
    return this.http.post<OnePiece>(this.url, chara).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('onePieceService.index(): error creating Characters: ' + err)
          );
        })
        );
  }

  update(chara: OnePiece): Observable<OnePiece> {
    if(chara.completed) {
      chara.lastUpdated =  this.datePipe.transform(Date.now(), 'shortDate'); // 8/24/1999
    } else {
      chara.lastUpdated = "";
    }
    return this.http.put<OnePiece>(this.url + "/" + chara.id, chara).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('onePieceService.index(): error updating Characters: ' + err)
          );
        })
        );
  }

  destroy(charaId: number): Observable<void> {
    return this.http.delete<void>(this.url + "/" + charaId).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('onePieceService.index(): error deleting Characters: ' + err)
          );
        })
        );
  }

}
