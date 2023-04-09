import 'dart:async';

import 'package:flutter/material.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/location');
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.black, // Définissez la couleur de fond sur noir
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            height: h, // Définissez la hauteur souhaitée
            width: w, // Définissez la largeur souhaitée
          ),
         // Ajoutez votre image de logo
        ),
      ),
    );
  }
}
