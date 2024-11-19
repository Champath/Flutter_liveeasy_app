import 'package:flutter/material.dart';
import 'package:liveeasy_app/Homepage.dart';
import 'package:firebase_core/firebase_core.dart';

void  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          radioTheme: const RadioThemeData(
            overlayColor: WidgetStatePropertyAll(Colors.black),
              fillColor: WidgetStatePropertyAll( Color.fromARGB(255, 4, 3, 52)),
          )
      ),
      home: const Homepage(),
    );
}
}