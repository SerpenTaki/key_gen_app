import 'package:flutter/material.dart';

class Tabbare extends StatefulWidget {
  const Tabbare({super.key});

  @override
  State<Tabbare> createState() => _TabbareState();
}

class _TabbareState extends State<Tabbare> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Tabs Demo"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          centerTitle: true,
          bottom: const TabBar(
             // indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              automaticIndicatorColorAdjustment: true,
              dividerColor: Colors.orange,
              tabs: [
                Tab(icon: Icon(Icons.directions_bike, color: Colors.white,), text: "bike",),
                Tab(icon: Icon(Icons.directions_bus, color: Colors.white,), text: "bus",),
                Tab(icon: Icon(Icons.directions_boat, color: Colors.white,), text: "Boat",),
              ]),
        ),
        body: null,
      ),
    );
  }
}
