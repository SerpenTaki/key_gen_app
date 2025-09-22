import 'package:flutter/material.dart';
import 'package:key_gen_app/RouteGenerator.dart';
import 'package:key_gen_app/providers/counter.dart';
import 'package:key_gen_app/screens/AuthPage.dart';
import 'package:key_gen_app/screens/PrimaPagina.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:key_gen_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //altrimenti crash
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Counter())],
        child: MyApp(),
      ));
  }

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigazione",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Primapagina();
          } else {
            return AuthPage();
          }
        },
      ),
      //widget
      // routes: { //route per navigare tra le pagine statico
      //  '/PrimaPagina' : (context) => Primapagina(),
      //  '/SecondaPagina' : (context) => Secondapagina(data: 'Frase da passare alla seconda pagina',),
      //},
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
