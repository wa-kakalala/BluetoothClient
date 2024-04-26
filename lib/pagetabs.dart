import 'package:flutter/material.dart';
import 'pages/bluetooth_show.dart';
import 'pages/bluetooth_control.dart';
import 'pages/ble_mannager.dart';

BlueToothShow blueshow = BlueToothShow();

// ignore: must_be_immutable
class PageTabs extends StatefulWidget {
  const PageTabs({super.key});
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _TabsState();
}

class _TabsState extends State<PageTabs> {
  int _currentIndex = 0;
  @override
  _TabsState() {
    super.initState();
    connect_bluetooth();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      blueshow,
      const BlueToothControl(),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("BluetoothClient"),
          ),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: "show",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: "control",
              ),
            ]),
      ),
    );
  }
}
