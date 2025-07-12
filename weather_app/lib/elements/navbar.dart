import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/elements/weekpage.dart';
import 'package:weather_app/imports.dart';

class NavBar extends StatefulWidget {
  late var data;
  
  Widget page = const Placeholder();
  NavBar({
    required this.data,
    super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  String title = 'Today';
  Widget page = const Placeholder();


  @override
  Widget build(BuildContext context) {


    switch(index){
      case 0: 
      title = 'Today';
      page = WeatherTile(data: widget.data);
      break;
      case 1:
      title = 'Week';
      page = WeekPage(data: widget.data);
      break; 
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          titleTextStyle: const TextStyle(
            fontSize: 23,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  farenheit = !farenheit;
                  setState(() {});
                },
                child: farenheit ? const Text('°F') : const Text('°C'),
              ),
            )
          ],
        ),
        body:Column(
          children: [
            Expanded(child: page),
            NavigationBar(destinations: const [
              NavigationDestination(label: "",icon: Icon(Icons.home)),
              NavigationDestination(label: "",icon: Icon(Icons.list)),
            ],
            selectedIndex: index,
            onDestinationSelected: (value) {
              setState(() {
                index = value;
              });
            },
           )
          ],
        )

    );
  }
}