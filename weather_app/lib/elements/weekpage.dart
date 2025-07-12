
import 'package:weather_app/imports.dart';



class WeekPage extends StatelessWidget {
  late var data;

  WeekPage({
    required this.data,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: ((context, index) => WeatherListTile(data: data, index: index+1)));
  }
}