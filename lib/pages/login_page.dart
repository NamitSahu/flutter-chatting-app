import 'package:chatting_app/models/user_model.dart';
import 'package:chatting_app/pages/complete_profile.dart';
import 'package:chatting_app/pages/myhome_page.dart';
import 'package:chatting_app/pages/signup_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passswordController = TextEditingController();

  void _showSnak(String title) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          title,
          style: const TextStyle(color: Colors.red),
        ),
        duration: const Duration(seconds: 2),
      ));

  void _checkValues() {
    String email = emailController.text.trim();
    String password = passswordController.text.trim();

    if (email == "" || password == "") {
      _showSnak("Please fill all the filled");
    } else {
      _login(email, password);
    }
  }

  void _login(String email, String password) async {
    UserCredential? credential;

    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      _showSnak(ex.message.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();

      UserModel userModel =
          UserModel.fromMap(userData.data() as Map<String, dynamic>);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(userModel: userModel, firebaseUser: credential!.user!,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  "Chat App",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passswordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CupertinoButton(
                  onPressed: () {
                    _checkValues();
                  },
                  color: Theme.of(context).colorScheme.secondary,
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have a account?",
            style: TextStyle(fontSize: 16),
          ),
          CupertinoButton(
            child: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
