import 'package:library_management/imports.dart';

void checkDatabases() {
  if (library.get('units') == null) {
    library.put('units', toListOfLists(unitList));
  } else {
    unitList = toListOfUnits(library.get('units'));
  }
  if (library.get('authors') == null) {
    library.put('authors', toListOfLists(authorList));
  }else {
    authorList = toListOfAuthors(library.get('authors'));
  }
  if (library.get('customers') == null) {
    library.put('customers', toListOfLists(customerList));
  } else {
    customerList = toListOfCustomers(library.get('customers'));
  }
  if (library.get('books') == null) {
    library.put('books', toListOfLists(bookList));
  } else {
    bookList = toListOfBooks(library.get('books'));
  }
}
