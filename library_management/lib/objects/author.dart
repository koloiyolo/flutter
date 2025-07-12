class Author {
  int authorId;
  String name;
  String surname;

  Author({required this.authorId, required this.name, required this.surname});

  String get() {
    return "$name $surname";
  }

  factory Author.fromList(List list) => Author(
      authorId: list.elementAt(0),
      name: list.elementAt(1),
      surname: list.elementAt(2));

  List toList() {
    return List.from([authorId, name, surname]);
  }
}

List<Author> toListOfAuthors (List list){
  List<Author> dummy = [];
  for (var element in list){
    dummy.add(Author.fromList(element));
  }
  return dummy;
}

int findAuthorId(String name, String surname) {
  for (var a in authorList) {
    if (a.name == name) {
      if (a.surname == surname) {
        return a.authorId;
      }
    }
  }
  createAuthor(name, surname);
  return authorList.length;
}

void createAuthor(String name, String surname) {
  authorList
      .add(Author(authorId: authorList.length+1, name: name, surname: surname));
}

List<Author> authorList = [
  Author(authorId: 1, name: "John Ronald Reul", surname: "Tolkien"),
  Author(authorId: 2, name: "Dimytrii", surname: "Gluchowsky"),
  Author(authorId: 3, name: "Stephen", surname: "King"),
];
