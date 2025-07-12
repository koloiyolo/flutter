import 'package:weather_app/imports.dart';

class WeatherTile extends StatelessWidget {
  var data;
  WeatherTile({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          BuildDay(datetime: DateTime.now(), size: 3.5),
          BuildDate(datetime: DateTime.now(), size: 2),
          //BuildText(text: 'Zone: ${data['current']['timezone']}',size: 1.5),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              BuildText(
                  text: farenheit
                      ? '${(data['current']['temp'] * 1.8 + 32).round()}°F'
                      : '${(data['current']['temp']).round()}°C',
                  size: 2.5),
              const Expanded(flex: 1, child: SizedBox()),
              Image.asset(
                  'lib/assets/${data['current']['weather'][0]['icon']}@2x.png'),
              const Expanded(flex: 2, child: SizedBox())
            ],
          ),
          BuildText(text: data['current']['weather'][0]['main'], size: 2),
          BuildText(
              text: farenheit
                  ? 'Percived temperature: ${(data['current']['feels_like'] * 1.8 + 32).round()}°F'
                  : 'Percived temperature: ${(data['current']['feels_like']).round()}°C',
              size: 1.3),
          ExpansionTile(

            title: BuildText(text: 'Time of the day', size: 1.5),

            children: [
              Row(children: [
                BuildText(
                    text: farenheit
                        ? ' ${(data['daily'][0]['temp']['morn'] * 1.8 + 32).round()}°F'
                        : ' ${(data['daily'][0]['temp']['morn']).round()}°C',
                    size: 1.3),
                const Expanded(flex: 1, child: SizedBox()),
                BuildText(
                    text: farenheit
                        ? ' ${(data['daily'][0]['temp']['day'] * 1.8 + 32).round()}°F'
                        : ' ${(data['daily'][0]['temp']['day']).round()}°C',
                    size: 1.3),
                const Expanded(flex: 1, child: SizedBox()),
                BuildText(
                    text: farenheit
                        ? ' ${(data['daily'][0]['temp']['eve'] * 1.8 + 32).round()}°F'
                        : ' ${(data['daily'][0]['temp']['eve']).round()}°C',
                    size: 1.3),
                const Expanded(flex: 1, child: SizedBox()),
                BuildText(
                    text: farenheit
                        ? ' ${(data['daily'][0]['temp']['night'] * 1.8 + 32).round()}°F'
                        : ' ${(data['daily'][0]['temp']['night']).round()}°C',
                    size: 1.3),
              ]),
              Row(
                children: [
                  BuildText(text: '6:00 - 12:00\nAM', size: 1.1),
                  const Expanded(flex: 1, child: SizedBox()),
                  BuildText(text: '12:00-6:00\nPM', size: 1.1),
                  const Expanded(flex: 1, child: SizedBox()),
                  BuildText(text: '6:00 - 12:00\nPM', size: 1.1),
                  const Expanded(flex: 1, child: SizedBox()),
                  BuildText(text: '12:00-6:00\nAM', size: 1.1),
                ],
              ),
              Row(
                children: [
                  BuildText(text: 'Morning', size: 1.3),
                  const Expanded(flex: 1, child: SizedBox()),
                  BuildText(text: 'Afternoon', size: 1.3),
                  const Expanded(flex: 1, child: SizedBox()),
                  BuildText(text: 'Evening', size: 1.3),
                  const Expanded(flex: 1, child: SizedBox()),
                  BuildText(text: 'Night', size: 1.3),
                ],
              )
            ],
          ),
          ExpansionTile(

            title: BuildText(text: 'More details', size: 1.5),

            children: [
              BuildText(
                  text: 'Pressure: ${data['current']['pressure']} hPa',
                  size: 1.3),
              BuildText(
                  text: 'Clouds density: ${data['current']['clouds']}%',
                  size: 1.3),
              BuildText(
                  text: 'Wind Speed: ${data['current']['wind_speed']} m/s',
                  size: 1.3)
            ],
          ),
          
        ],
      ),
    );
  }
}
