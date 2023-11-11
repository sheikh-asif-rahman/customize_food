import 'package:customize_food/signin_signup/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customize food order', //title of our project
      debugShowCheckedModeBanner: false, //to hide to right side debug banner
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
      ),
      home: const SigninScreen(), //route to signup screen at starting
    );
  }
}
