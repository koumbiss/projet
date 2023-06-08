import 'package:flutter/material.dart';
import 'package:projet_etudes/client/homepage.dart';
import 'package:projet_etudes/client/locationselection.dart';
import 'package:projet_etudes/client/regionselection.dart';
import 'package:projet_etudes/client/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/location': (BuildContext context) => const LocationSelection(),
        '/region': (BuildContext context) => RegionSelection(),
        '/home': (BuildContext context) => MyHomePage(
              collections: const [],
            ),
      },
    );
  }
}
