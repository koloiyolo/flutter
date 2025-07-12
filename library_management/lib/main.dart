import 'package:library_management/db/db.dart';
import 'package:library_management/scaffold.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'imports.dart';

late Box library;

Future<void> main() async {

  await Hive.initFlutter();
  library = await Hive.openBox('library');
  checkDatabases();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Library',
        theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
            colorSchemeSeed: Colors.orange),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            colorSchemeSeed: Colors.orangeAccent),
        themeMode: ThemeMode.dark,
        home: const AppScaffold());
  }
}
