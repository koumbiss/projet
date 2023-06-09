import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:projet_etudes/client/homepage.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Ma superbe application',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          headline1: TextStyle(color: Colors.white),
          // ignore: deprecated_member_use
          bodyText1: TextStyle(color: Colors.white),
          // Ajoutez d'autres styles de texte personnalisés ici si nécessaire
        ),
      ),
      home: MyHomePage(),
    );
  }
}
