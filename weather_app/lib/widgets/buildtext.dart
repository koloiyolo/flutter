import 'package:weather_app/imports.dart';

class BuildText extends StatelessWidget {
  String text;
  double size = 1;
  BuildText({
    required this.text,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 13 * size),
      ),
    ));
  }
}