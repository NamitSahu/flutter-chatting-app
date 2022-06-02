import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class MyHomePage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  const MyHomePage({Key? key, required this.userModel, required this.firebaseUser}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Chatting App"),
        centerTitle: true,
      ),
    );
  }
}