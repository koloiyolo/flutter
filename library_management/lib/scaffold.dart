import 'package:flutter/material.dart';
import 'package:library_management/pages/author_page/page.dart';
import 'package:library_management/pages/books_page/page.dart';
import 'package:library_management/pages/customer_page/page.dart';
import 'package:library_management/pages/settings/settings_page.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int index = 0;
  Widget page = const Placeholder();
  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        page = const BooksPage();
        break;
      case 1:
        page = const CustomerPage();
        break;
      case 2:
        page = const AuthorPage();
        break;
      case 3:
        page = const SettingsPage();
        break;
      default:
        page = const BooksPage();
    }
    return Scaffold(
      // appBar: AppBar(
      //         title: Text((index == 0) ? "Books"
      //         : (index == 1) ? "Users": "Settings" ) ,
      //       ),

      body: Row(
        children: [
          NavigationRail(
            extended: true,
            selectedIndex: index,
            onDestinationSelected: (value) {
              setState(() {
                index = value;
              });
            },
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.menu_book_rounded), label: Text("Books")),
              NavigationRailDestination(
                  icon: Icon(Icons.person_2_rounded), label: Text("Customers")),
              NavigationRailDestination(
                  icon: Icon(Icons.info), label: Text("Authors")),
              NavigationRailDestination(
                  icon: Icon(Icons.settings), label: Text("Settings")),
            ],
          ),
          Expanded(child: page)
        ],
      ),
    );
  }
}
