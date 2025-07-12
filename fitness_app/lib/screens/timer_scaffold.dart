import 'package:fitness_app/screens/stopwatchpages/stopwatchlist.dart';
import 'package:fitness_app/screens/stopwatchpages/stopwatchtimer.dart';

import '../imports.dart';

class TimerScaffold extends StatefulWidget {
  final int mod;
  final String boxName;
  final List<StopWatch> list;

  const TimerScaffold(
      {required this.list,
      required this.boxName,
      required this.mod,
      super.key});

  @override
  State<TimerScaffold> createState() => _TimerScaffoldState();
}

class _TimerScaffoldState extends State<TimerScaffold> {
  late Widget page;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        page = StopWatchTimerPage(
            list: widget.list, box: widget.boxName, mod: widget.mod);
        break;
      case 1:
        page = StopWatchList(
          list: widget.list,
        );
        break;
    }
    return Column(
      children: [
        Expanded(child: page),
        NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.timer,
                  ),
                  label: ''),
              NavigationDestination(icon: Icon(Icons.list), label: ''),
            ],
            selectedIndex: index,
            onDestinationSelected: (value) => setState(() {
                  index = value;
                })),
      ],
    );
  }
}
