export class OnePiece {
  id: number;
  firstName: string;
  lastName: string;
  imageUrl: string;
  lastUpdated: string | null;
  dateAdded: string | null;
  completed: boolean;



  constructor(
    id: number = 0,
    firstName: string = "",
    lastName: string = "",
    imageUrl: string = "",
    lastUpdated: string = "",
    dateAdded: string = "",
    completed: boolean = false
  ){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.imageUrl = imageUrl;
    this.lastUpdated = lastUpdated;
    this.dateAdded = dateAdded;
    this.completed = completed;
  }
}
