import 'package:library_management/imports.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {
                library.clear();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Reset DB',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              )),
        )
      ],
    ));
  }
}
