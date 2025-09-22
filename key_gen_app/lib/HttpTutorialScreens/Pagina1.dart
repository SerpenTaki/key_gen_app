import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:key_gen_app/models/album_model.dart';
import 'package:location/location.dart';

import '../services/auth.dart';

Future<List<Album>> fetchAlbum() async {
  var response = await http.get(
    Uri.parse("http://jsonplaceholder.typicode.com/albums"),
  );

  // Aggiungi questo controllo!
  if (response.statusCode == 200) {
    var body = json.decode(response.body);
    List<Album> albums = [];
    for (var i = 0; i < body.length; i++) {
      albums.add(Album.fromJson(body[i]));
    }
    return albums;
  } else {
    // Se la risposta non è 200, lancia un'eccezione
    throw Exception(
        'Failed to load albums with status code: ${response.statusCode}');
  }
}

class Pagina1 extends StatefulWidget {
  const Pagina1({super.key});

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  // Dichiarazione corretta: solo 'late'
  late Future<List<Album>> albums;

  @override
  void initState() {
    super.initState();
    // Inizializzazione in initState come hai fatto correttamente
    albums = fetchAlbum();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.width);

    return Scaffold(
      backgroundColor: size.width < 600 ? Colors.white : Colors.green,
      appBar: AppBar(title: const Text("HTTP chiamate app"),
      ),
      body: FutureBuilder<List<Album>>( // Aggiunto il tipo generico
        future: albums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Errore: ${snapshot.error}");
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            return OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text("[${snapshot.data![index].id}]: ${snapshot
                            .data![index].title}"),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 6,
                        crossAxisCount: orientation == Orientation.portrait ? 1 : 3),
                  );
                });
          } else {
            return const Center(child: Text("Nessun dato disponibile."));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        Location location = Location();

        bool serviceEnabled; //servizio di geolocalizzazione
        PermissionStatus permissionGranted; //permessi di accesso
        LocationData locationData;

        serviceEnabled = await location.serviceEnabled();
        if (!serviceEnabled) { //se non è abilitato richiede di abilitarlo altrimenti non fa nulla
          serviceEnabled = await location.requestService();
          if (!serviceEnabled) {
            return;
          }
        }

        permissionGranted = await location.hasPermission();
        if (permissionGranted == PermissionStatus
            .denied) { //se non è abilitato richiede di abilitarlo altrimenti non fa nulla
          permissionGranted = await location.requestPermission();
          if (permissionGranted != PermissionStatus.granted) {
            return;
          }
        }

        locationData = await location.getLocation();

        print("Latitudine: ${locationData.latitude}, Longitude: ${locationData
            .longitude}");

        // location.onLocationChanged.listen((LocationData currentLocation) {
        // Use current location
        // print("Cambio di posizione: ${currentLocation.latitude}, ${currentLocation.longitude}");
        // });
      }, child: const Icon(Icons.location_city),),
    );
  }
}