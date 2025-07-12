import 'package:weather_app/private/private.dart';
import 'package:http/http.dart' as http;
import 'elements/navbar.dart';
import 'imports.dart';

class PageScaffold extends StatefulWidget {
  const PageScaffold({super.key});

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  int index = 0;
  Widget page = Placeholder();
  String title = '';

  Future<Map<String, dynamic>> getWeather() async {
    var _permissionGranted = await Geolocator.checkPermission();

    if (_permissionGranted != LocationPermission.always ||
        _permissionGranted != LocationPermission.whileInUse) {
      await Geolocator.requestPermission();
    }

    final position = await Geolocator.getCurrentPosition();
    pos = position;

    final url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=$key';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }

  @override
  void initState() {
    futureWeather = getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              future: futureWeather,
              builder: ((context, snapshot) {
                if(snapshot.hasData){
                  return NavBar(data: snapshot.data);
                }
                  return const Scaffold(
                    body:Center(child: CircularProgressIndicator())
                  );
                
            }));
          
        
  }
}
