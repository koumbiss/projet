import 'package:flutter/material.dart';
import 'package:projet_etudes/client/loginScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const forhei = 30.0;
    const String signin = "s'enregistrer";
    const String dejacompte = "Tu as déjà un compte ?";
    const String login = "se connecter";

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(forhei),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/logo.png"),
                  height: size.height * 0.25,
                ),
                Text(
                  "Bienvenue, crée ton compte YL",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: forhei - 10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("Full Name"),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.white))),
                        ),
                        const SizedBox(
                          height: forhei - 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("E-mail"),
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.white))),
                        ),
                        const SizedBox(
                          height: forhei - 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("Telephone"),
                              prefixIcon: Icon(
                                Icons.numbers,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.white))),
                        ),
                        const SizedBox(
                          height: forhei - 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("Mot de passe"),
                              prefixIcon: Icon(
                                Icons.fingerprint,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.white))),
                        ),
                        const SizedBox(
                          height: forhei - 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text("Confirmer le mot de passe"),
                              prefixIcon: Icon(
                                Icons.fingerprint,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.white))),
                        ),
                        SizedBox(
                          height: forhei - 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Text(
                                signin.toUpperCase(),
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                alignment: Alignment.center,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const loginScreen()),
                              );
                            },
                            child: const Text(dejacompte)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
