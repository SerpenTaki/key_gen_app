import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title:  Text('Tabs'),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              Column( // Changed Center to Column to accommodate multiple children
                mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
                children: [
                  Text("Benvenuto nella nostra applicazione"),
                  const SizedBox(height: 16),
                   Icon(Icons.telegram),
                  const SizedBox(height: 16),
                   TextButton(
                    onPressed: () =>  {},
                    child:  Text('Sono un pulsante'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.directions_transit),
                  const SizedBox(height: 16),
                  Text("Che tu prenda un treno per muoverti"),

                ],
              ),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
