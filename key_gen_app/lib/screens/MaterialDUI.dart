import 'package:flutter/material.dart';

class Materialdui extends StatefulWidget {
  const Materialdui({super.key});

  @override
  State<Materialdui> createState() => _MaterialduiState();
}

class _MaterialduiState extends State<Materialdui> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      title: "Material Google",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Material Google")),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text("LR"),
                ),
                label: Text("Luca Rossi"),
                backgroundColor: Colors.grey,
                deleteIcon: Icon(Icons.delete),
              ),
             // CircularProgressIndicator(),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text("Simple Dialog"),
                        children: [
                          SimpleDialogOption(
                            onPressed: () => {Navigator.pop(context)},
                            child: Text("Option 1"),
                          ),
                          SimpleDialogOption(
                            onPressed: () => {Navigator.pop(context)},
                            child: Text("Option 2"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("SimpleDialog"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("AlertDialog"),
                        content: Text("Questo è un AlertDialog"),
                        actions: [
                          TextButton(
                            onPressed: () => {},
                            child: Text("Bellissimo"),
                          ),
                          TextButton(
                            onPressed: () => {Navigator.pop(context)},
                            child: Text("Torna indietro"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("AlertDialog"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {Navigator.pop(context);},
                child: Text("Torna indietro"),
              ),
            ],
          ),
        ), // You might want to add some content here
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: Text("Quello che volete"),
              action: SnackBarAction(label: "undo", onPressed: () {}),
            );
            _messangerKey.currentState?.showSnackBar(snackBar);
          },
          child: Icon(Icons.add), // Added an icon to the FAB
        ),
      ),
    );
  }
}
