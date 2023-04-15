import { TestBed } from '@angular/core/testing';

import { OnePieceCharactersService } from './one-piece-characters.service';

describe('OnePieceCharactersService', () => {
  let service: OnePieceCharactersService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(OnePieceCharactersService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
