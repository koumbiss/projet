import 'package:flutter/material.dart';
import 'package:projet_etudes/client/loginScreen.dart';
import 'package:projet_etudes/client/sign_in_screen.dart';
import 'package:projet_etudes/fournisseur/Homepage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final String welcomTit = "Bienvenue dans notre univers.";
  final String welcomSubTit = "Nous vous offrons une experience sur mesure.";
  final String login = "se connecter";
  final String signin = "s'enregistrer";
  final String welcomeScreenImage = "assets/the one.jpeg";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(welcomeScreenImage),
              height: height * 0.6,
            ),
            Column(
              children: [
                Text(
                  welcomTit,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  welcomSubTit,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: Text(signin.toUpperCase()))),
                const SizedBox(width: 10.0),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const loginScreen()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: Text(login.toUpperCase()))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
