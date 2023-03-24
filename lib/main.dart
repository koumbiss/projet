import 'package:flutter/material.dart';
import 'package:projet_etudes/regionselectionpage.dart';
import 'package:projet_etudes/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Ajoutez ici le code pour charger les données nécessaires à l'application
    // et pour passer à la page suivante une fois que le chargement est terminé.
    // Par exemple, vous pouvez utiliser un Future.delayed pour afficher
    // la fenêtre de sélection de région après quelques secondes :
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegionSelectionPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon application'),
      ),
      body: const Center(
        child: Text('Bienvenue sur ma page d\'accueil !'),
      ),
    );
  }
}
