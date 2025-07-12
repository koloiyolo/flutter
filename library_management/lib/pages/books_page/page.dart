import 'package:library_management/imports.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Book> current = bookList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Text("Categories:"),
                  const SizedBox(width: 16),
                  categoryType('All'),
                  const SizedBox(width: 16),
                  categoryType('Adventure'),
                  const SizedBox(width: 16),
                  categoryType('Horror'),
                  const SizedBox(width: 16),
                  categoryType('PostApo'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: current.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: listTile(index),
                    );
                  },
                ),
              ),
            ],
          ),
          (currentCustomerId == 0)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                        child: const Icon(Icons.add, size: 48),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              var title = TextEditingController();
                              var name = TextEditingController();
                              var surname = TextEditingController();
                              var category = TextEditingController();
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text("Add new book"),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: title,
                                      decoration: const InputDecoration(
                                          hintText: "Title"),
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: name,
                                      decoration: const InputDecoration(
                                          hintText: "Author name"),
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: surname,
                                      decoration: const InputDecoration(
                                          hintText: "Author surname"),
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: category,
                                      decoration: const InputDecoration(
                                          hintText: "Category"),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          child: MaterialButton(
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                        ),
                                        Card(
                                          child: MaterialButton(
                                              child: const Text(
                                                "Add",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  addBook(
                                                      title.text,
                                                      name.text,
                                                      surname.text,
                                                      category.text);
                                                      library.put('books', toListOfLists(bookList));
                                                });
                                                Navigator.pop(context);
                                              }),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget listTile(int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListTile(
        leading: const Icon(Icons.menu_book_rounded, size: 72.0),
        title: Text('${index + 1}. ${current[index].title}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Author: ${authorList[current[index].authorId - 1].name} ${authorList[current[index].authorId - 1].surname}'),
            Text('Category: ${current[index].type}'),
            Text(
                'Currently avilable: ${howManyAvilable(current[index].bookId)}/${howMany(current[index].bookId)}')
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            (currentCustomerId == 0)
                ? MaterialButton(
                    minWidth: 24,
                    onPressed: () {
                      setState(() {
                        addOne(bookList[index].bookId);
                        library.put('units', toListOfLists(unitList));
                      });
                    },
                    child: const Icon(Icons.add))
                : const SizedBox(),
            GestureDetector(
              onTap: (currentCustomerId != 0 &&
                      ownedBy(currentCustomerId, current[index].bookId))
                  ? () {
                      setState(() {
                        returnBook(currentCustomerId, current[index].bookId);
                        library.put('units', toListOfLists(unitList));
                      });
                    }
                  : (currentCustomerId != 0 &&
                          !ownedBy(currentCustomerId, current[index].bookId))
                      ? () {
                          setState(() {
                            borrowBook(
                                currentCustomerId, current[index].bookId);
                                library.put('units', toListOfLists(unitList));
                          });
                        }
                      : () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              var title = TextEditingController();
                              title.text = current[index].title;
                              var author = TextEditingController();
                              author.text = current[index].authorId.toString();
                              var category = TextEditingController();
                              category.text = current[index].type;

                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Edit book book",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: title,
                                      decoration: const InputDecoration(
                                          hintText: "Title"),
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: author,
                                      decoration: const InputDecoration(
                                          hintText: "Author Id"),
                                    ),
                                    const SizedBox(height: 8),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: category,
                                      decoration: const InputDecoration(
                                          hintText: "Category"),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          child: MaterialButton(
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                        ),
                                        Card(
                                          child: MaterialButton(
                                              child: const Text(
                                                "Save",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  current[index].title =
                                                      title.text;
                                                  current[index].authorId =
                                                      int.parse(author.text);
                                                  current[index].type =
                                                      category.text;
                                                  library.put('books', toListOfLists(bookList));
                                                });
                                                Navigator.pop(context);
                                              }),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
              child: (currentCustomerId != 0 &&
                      ownedBy(currentCustomerId, current[index].bookId))
                  ? const Icon(
                      Icons.bookmark_remove,
                      size: 48,
                    )
                  : (currentCustomerId != 0 &&
                          !ownedBy(currentCustomerId, current[index].bookId))
                      ? const Icon(
                          Icons.bookmark_add,
                          size: 48,
                        )
                      : const Icon(
                          Icons.edit,
                          size: 32,
                        ),
            ),
            (currentCustomerId == 0)
                ? MaterialButton(
                    minWidth: 24,
                    onPressed: () {
                      setState(() {
                        removeOne(bookList[index].bookId);
                        library.put('units', toListOfLists(unitList));
                      });
                    },
                    child: const Icon(Icons.remove))
                : const SizedBox(),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  GestureDetector categoryType(String type) {
    return GestureDetector(
        onTap: () {
          if (type != 'All') {
            current = filterType(type);
          } else {
            current = bookList;
          }
          setState(() {});
        },
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(type),
        )));
  }
}
