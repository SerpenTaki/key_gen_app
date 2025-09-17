import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _deleteCounter(){
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.wallet)),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'Applicazione Enorme',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                backgroundColor: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                shadows: [
                  Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0)
                  ),
                ]
              ),
            ),
            TextButton.icon(onPressed: () => {}, icon: Icon(Icons.account_box), label: const Text("Bottone 1"),),
            ElevatedButton(
              onPressed: () => {}, 
              child: Text('Bottone1'),
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.red),
                overlayColor: WidgetStateColor.resolveWith((states) {
                  // If the button is pressed, return green, otherwise blue
                  if (states.contains(WidgetState.focused)) { // vecchio metodo
                    return Colors.green;
                  }
                  else if (states.contains(WidgetState.hovered)){
                    return Colors.blue;
                  }
                  else{
                    return Colors.red;
                  }
                }
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.timelapse),
              label: Text("Bottone2"),
              style: ElevatedButton.styleFrom( //converte automaticamente in widgetStateColor
                foregroundColor: Colors.red, //Nuovo metodo
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              ),
            ),
            OutlinedButton(onPressed: () => {}, child: Text('Ciao')),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16), // Add some spacing between the buttons
          FloatingActionButton(
            onPressed: _deleteCounter,
            tooltip: 'Delete',
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
