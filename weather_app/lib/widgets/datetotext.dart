import 'package:weather_app/imports.dart';

class BuildDate extends StatelessWidget {
  final DateTime datetime;
  late double size;
  BuildDate({
    required this.size,
    required this.datetime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildText(text: (datetime.month==1) ? '${datetime.day} January ${datetime.year}'
                            : (datetime.month==2) ? '${datetime.day} February ${datetime.year}'
                            : (datetime.month==3) ? '${datetime.day} March ${datetime.year}'
                            : (datetime.month==4) ? '${datetime.day} April ${datetime.year}'
                            : (datetime.month==5) ? '${datetime.day} May ${datetime.year}'
                            : (datetime.month==6) ? '${datetime.day} June ${datetime.year}'
                            : (datetime.month==7) ? '${datetime.day} July ${datetime.year}'
                            : (datetime.month==8) ? '${datetime.day} August ${datetime.year}'
                            : (datetime.month==9) ? '${datetime.day} September ${datetime.year}'
                            : (datetime.month==10) ? '${datetime.day} October ${datetime.year}'
                            : (datetime.month==11) ? '${datetime.day} November ${datetime.year}'
                            :'${datetime.day} December ${datetime.year}', size: size);
  }
}