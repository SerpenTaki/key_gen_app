import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLogin = true;

  Future<void> signIn() async{
    try{
      await Auth().signInWithEmailAndPassword(email: _email.text, password: _password.text);
    }on FirebaseAuthException catch (error){}
  }

  Future<void> createUser() async{
    try{
      await Auth().createUserWithEmailAndPassword(email: _email.text, password: _password.text);
    }on FirebaseAuthException catch (error){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,

        children: [
          TextField(
            controller: _email,
            decoration: InputDecoration(label: Text("Email")),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(label: Text("password")),
          ),
          ElevatedButton(onPressed: () {
            isLogin? signIn(): createUser();
          }, child: Text(isLogin ? "Login" : "Register")),
          TextButton(onPressed: () {
            setState(() {
              isLogin = !isLogin;
            });
          }, child: Text(isLogin ? "Non hai un account? Registrati" : "Hai un account? Accedi"))
        ],
      ),
    );
  }
}
