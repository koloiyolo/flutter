import 'book.dart';


class Unit {
  int unitId;
  int bookId;
  int customerId;

  Unit({required this.unitId, required this.customerId, required this.bookId});

  factory Unit.fromList(List list) => Unit(
      unitId: list.elementAt(0),
      bookId: list.elementAt(1),
      customerId: list.elementAt(2),
      );

  List toList() {
    return List.from([unitId, bookId, customerId]);
  }
}

List<Unit> toListOfUnits (List list){
  List<Unit> dummy = [];
  for (var element in list){
    dummy.add(Unit.fromList(element));
  }
  return dummy;
}

int howMany(int bookId) {
  int output = 0;
  for (var u in unitList) {
    if (u.bookId == bookId) {
      output++;
    }
  }
  return output;
}

int howManyAvilable(int bookId) {
  int output = 0;
  for (var u in unitList) {
    if (u.bookId == bookId && u.customerId == 0) {
      output++;
    }
  }
  return output;
}

List<Book> currentlyOwnedBy(int customerId) {
  List<Book> dummy = [];
  for (var u in unitList) {
    if (u.customerId == customerId) {
      for (var b in bookList) {
        if (u.bookId == b.bookId) {
          dummy.add(b);
        }
      }
    }
  }
  return dummy;
}

bool ownedBy(int customerId, int bookId) {
  for (var u in unitList) {
    if (u.customerId == customerId) {
      if (u.bookId == bookId) {
        return true;
      }
    }
  }
  return false;
}

String borrowBook(int customerId, int bookId) {
  List units = [];
  for (var u in unitList) {
    if (bookId == u.bookId) {
      if (u.customerId == customerId) {
        return "user already has this book";
      }
      units.add(u);
    }
  }
  for (var u in units) {
    if (u.customerId == 0) {
      u.customerId = customerId;
      return "Succesfull operation";
    }
  }
  return "Book not found";
}

String returnBook(int customerId, int bookId) {
  for (var u in unitList) {
    if (bookId == u.bookId) {
      if (u.customerId == customerId) {
        u.customerId = 0;
        return "returned successfully";
      }
    }
  }
  return "";
}

void addOne(int bookId){
  unitList.add(Unit(unitId: unitList.length+1, customerId: 0, bookId: bookId));
}

bool removeOne(int bookId){
  for(var u in unitList){
    if(u.bookId == bookId && u.customerId == 0){
      unitList.remove(u);
      return true;
    }
  }
  return false;
}


List<Unit> unitList = [
  Unit(unitId: 1, customerId: 0, bookId: 1),
  Unit(unitId: 2, customerId: 1, bookId: 1),
  Unit(unitId: 3, customerId: 0, bookId: 1),
  Unit(unitId: 4, customerId: 0, bookId: 2),
  Unit(unitId: 5, customerId: 0, bookId: 2),
  Unit(unitId: 6, customerId: 2, bookId: 3),
  Unit(unitId: 7, customerId: 2, bookId: 4),
  Unit(unitId: 8, customerId: 1, bookId: 4),
  Unit(unitId: 9, customerId: 0, bookId: 4),
  Unit(unitId: 10, customerId: 1, bookId: 5),
  Unit(unitId: 11, customerId: 0, bookId: 5),
];
