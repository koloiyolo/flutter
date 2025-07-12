import 'package:library_management/imports.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 330,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: authorList.length,
              itemBuilder: ((context, index) => listTile(index))),
          (currentCustomerId == 0)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        onPressed: () {showDialog(
                          context: context,
                          builder: (context) {
                            var name = TextEditingController();
                            var surname = TextEditingController();
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Add new author"),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: name,
                                    decoration:
                                        const InputDecoration(hintText: "name"),
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: surname,
                                    decoration: const InputDecoration(
                                        hintText: "surname"),
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
                                                createAuthor(
                                                    name.text, surname.text);
                                                  library.put('authors', toListOfLists(authorList));
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
                        );},
                        child: const Icon(Icons.add, size: 48),
                      )),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget listTile(int index) {
    List<Book> books = writtenBy(authorList[index].authorId);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 64),
            Text(
              authorList[index].get(),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text("Books: "),
            SizedBox(
              height: 80,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('- ${books[index].title}'),
                      const SizedBox(height: 8)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
