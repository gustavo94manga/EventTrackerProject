# EventTrackerProject


## Technologies Used
Java

## Lessons Learned
I learned how to use Spring Data JPA to create crud methods. It was a lot simpler to use the methods provided with a service implementation class and repsitory interface. After my entities were mapped, I was able to go in and test those entites to make sure I had a solid connection to my database which I created using MySQL Workbench. Once that was taken care of, I made use of the methods that JPA provided me with in order to complete this project. I learned that using Spring Data JPA cut my coding time by almost half.

| HTTP Verb | URI                  | Request Body | Response Body |
|-----------|----------------------|--------------|---------------|
| GET       | `/api/characters`      |              | Collection of representations of all _onepiece_ resources |collection** endpoint |
| GET       | `/api/characters/1`   |              | Representation of _onepiece_ `1` |
| POST      | `/api/characters`      | Representation of a new _onepiece_ resource | Description of the result of the operation | **
| PUT       | `/api/characters/2`   | Representation of a new version of _onepiece_ `1` |
| DELETE    | `/api/characters/2`   |              | |

