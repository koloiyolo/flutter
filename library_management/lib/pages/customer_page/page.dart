import 'package:library_management/imports.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 330,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: customerList.length,
                itemBuilder: ((context, index) {
                  var loggedIn =
                      (currentCustomerId == customerList[index].customerId);
                  var books = currentlyOwnedBy(customerList[index].customerId);
                  return listTile(index, books, loggedIn, context);
                }),
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
                            var name = TextEditingController();
                            var surname = TextEditingController();
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Add new customer"),
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
                                                addCustomer(
                                                    name.text, surname.text);
                                                  library.put('customers', toListOfLists(customerList));
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
    ));
  }

  Card listTile(
      int index, List<Book> books, bool loggedIn, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 64),
            Text(
              customerList[index].get(),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            const Text("Currently has: "),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: !loggedIn
                    ? () {
                        setState(() {
                          currentCustomerId = customerList[index].customerId;
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text("User logged in succesfully"),
                            ),
                          );
                        });
                      }
                    : () {
                        setState(() {
                          currentCustomerId = 00;
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text("User logged out succesfully"),
                            ),
                          );
                        });
                      },
                child: Text(loggedIn ? "Logout" : "Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
