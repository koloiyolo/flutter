import 'package:weather_app/imports.dart';

class WeatherListTile extends StatelessWidget {
  late int index;
  late var data;
  WeatherListTile({required this.data, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          BuildDay(
              datetime: DateTime.now().add(Duration(days: index)), size: 2),
          const Expanded(child: SizedBox()),
          BuildText(
              text: farenheit
                  ? '${(data['daily'][index]['temp']['day'] * 1.8 + 32).round()}°F'
                  : '${(data['daily'][index]['temp']['day']).round()}°C',
              size: 2),
          Image.asset(
              'lib/assets/${data['daily'][index]['weather'][0]['icon']}@2x.png',
              scale: 2),
        ],
      ),
      children: [
        BuildText(text: data['daily'][index]['weather'][0]['main'], size: 2),
        BuildText(
                  text: farenheit
                      ? 'Percived temperature: ${(data['daily'][index]['feels_like']['day'] * 1.8 + 32).round()}°F'
                      : 'Percived temperature: ${(data['daily'][index]['feels_like']['day']).round()}°C',
                  size: 1.3),
        BuildText(text: 'Pressure: ${data['daily'][index]['pressure']} hPa',size:1.3),
        BuildText(text: 'Cloud Density: ${data['daily'][index]['clouds']} %',size:1.3),
        BuildText(text: 'Wind speed: ${data['daily'][index]['wind_speed']} m/s',size:1.3),

      ],
    );
  }
}
