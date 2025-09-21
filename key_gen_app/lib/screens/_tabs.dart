import 'package:flutter/material.dart';
import 'package:key_gen_app/screens/PrimaPagina.dart';
import 'package:key_gen_app/screens/Carta.dart';
import 'package:key_gen_app/screens/Sliddare.dart';
import 'package:key_gen_app/screens/MaterialDUI.dart';

class Tabbare extends StatefulWidget {
  const Tabbare({super.key});

  @override
  State<Tabbare> createState() => _TabbareState();
}

class _TabbareState extends State<Tabbare> {
  bool isChecked = false;
  String genere = "maschio";
  double valoreSlider = 40;
  String nome = "";
  String cognome = "";
  final _formKey = GlobalKey<FormState>();
  Map data = {"nome": "", "cognome": ""};
  bool checkboxvalue = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Tabs Demo"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          centerTitle: true,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text("Flutter Tabs Demo", textAlign: TextAlign.center,),
              //Se metti qui la tabbar non hai problemi e non fa lo spazio sopra brutto
            ],
          ),
          bottom: TabBar(
            //isScrollable: true, //per tanti elementi tipo 7 e otto
            // indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            automaticIndicatorColorAdjustment: true,
            dividerColor: Colors.orange,
            //indicator: BoxDecoration(
            //  borderRadius: BorderRadius.circular(50),
            //  color: Colors.blue,
            //),
            tabs: const [
              Tab(
                icon: Icon(Icons.directions_bike, color: Colors.white),
                text: "bike",
              ),
              Tab(
                icon: Icon(Icons.directions_bus, color: Colors.white),
                text: "bus",
              ),
              Tab(
                icon: Icon(Icons.directions_boat, color: Colors.white),
                text: "Boat",
              ),
              Tab(
                icon: Icon(Icons.account_balance_outlined, color: Colors.white),
                text: "FormElements",
              ),
              Tab(
                icon: Icon(Icons.login, color: Colors.white),
                text: "Form",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Primapagina(),
            //Carta(),
            //Sliddare(), //Attenzione che importa l'intera pagina con tutti i suoi widget, floating action button e appbar
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.directions_bike, color: Colors.black),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/MaterialDUI");
                  },
                  child: Text("Proviamo i gadget di Material Design"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                print("tappato");
              },
              onDoubleTap: () {
                print("doppio tappato");
              },
              onLongPress: () {
                print("lungo premuto");
              },
              child: Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Hero(
                      tag: "immagine_prova",
                      child: Image.asset(
                        'images/purple.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("tappato");
              },
              onDoubleTap: () {
                print("doppio tappato");
              },
              onLongPress: () {
                print("lungo premuto");
              },
              splashColor: Colors.redAccent,
              child: Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8), //Elements
              child: Column(
                children: [
                  TextField(
                    //readOnly: true,
                    //enabled: false,
                    // minLines: 5,
                    // maxLines: 6,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Scrivi qui",
                      fillColor: Colors.grey[200],
                      // Colore di sfondo quando non � in focus
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2.0,
                        ), // Bordo viola quando in focus
                      ),
                    ),
                    cursorColor: Colors.red,
                    obscureText: false,
                    //password

                    //obscuringCharacter: "q", //this is for the character that will be shown when you type a password
                    style: TextStyle(
                      //this is the style of the textfield
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.all(Colors.blue),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Radio(
                    value: "maschio",
                    groupValue: genere,
                    onChanged: (value) {
                      setState(() {
                        genere = value!;
                      });
                    },
                  ),
                  Radio(
                    value: "femmina",
                    groupValue: genere,
                    onChanged: (value) {
                      setState(() {
                        genere = value!;
                      });
                    },
                  ),
                  Slider(
                    value: valoreSlider,
                    max: 100,
                    //divisions: 5,
                    onChanged: (value) {
                      print("valore slider: $value");
                      setState(() {
                        valoreSlider = value;
                      });
                    },
                  ),
                  Switch(
                    activeThumbColor: Colors.white,
                    activeTrackColor: Colors.blue,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8), //Form
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Inserisci il nome";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          data["nome"] = value;
                        },
                        textInputAction: TextInputAction.next,
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Nome"),
                          fillColor: Colors.grey[200],
                          // Colore di sfondo quando non � in focus
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                              width: 2.0,
                            ), // Bordo viola quando in focus
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Inserisci il cognome";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          data["cognome"] = value;
                        },
                        decoration: InputDecoration(
                          label: Text("Cognome"),
                          fillColor: Colors.grey[200],
                          // Colore di sfondo quando non � in focus
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                              width: 2.0,
                            ), // Bordo viola quando in focus
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: FormField(
                        builder: (state) {
                          return Column(
                            children: [
                          Row(
                          children: [
                          Checkbox(
                          value: checkboxvalue,
                            onChanged: (value) {
                              setState(() {
                                checkboxvalue = value!;
                              });
                            },
                          ),
                          Text("Accetto le condizioni")
                          ],
                          ),
                          Text(state.errorText ?? "",
                          style: TextStyle(
                            color: Colors.red,
                          )
                          )
                          ,
                          ]
                          ,
                          );
                        },
                        validator: (value) {
                          if (!checkboxvalue) {
                            return "Devi accettare le condizioni";
                          } else {
                            return null;
                          }
                        }
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Form validato");
                          _formKey.currentState!.save();
                          print(data);
                        }
                      },
                      child: Text("Invia"),
                    ),
                    // Text("Nome: $nome \n Cognome: $cognome"),
                  ],
                ),
              ),
              //Form //Usare le librerie per i form altrimenti viene tutta sta smatta per 2 campi
            ),
          ],
        ),
      ),
    );
  }
}
