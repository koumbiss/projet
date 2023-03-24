import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_etudes/regionselectionpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        // ignore: prefer_const_constructors
        MaterialPageRoute(builder: (context) => RegionSelectionPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black, // Définissez la couleur de fond sur noir
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            height: 150, // Définissez la hauteur souhaitée
            width: 150, // Définissez la largeur souhaitée
          ), // Ajoutez votre image de logo
        ),
      ),
    );
  }
}
