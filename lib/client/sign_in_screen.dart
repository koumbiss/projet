import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_etudes/client/Menu.dart';
import 'package:projet_etudes/client/loginScreen.dart';
import 'package:projet_etudes/services/Authentification.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myemailController = TextEditingController();
    final mypasswordController = TextEditingController();
    final mypasswordconfirmationController = TextEditingController();
    final mynameController = TextEditingController();

    final adresseController = TextEditingController();
    final myphoneController = TextEditingController();
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    const forhei = 30.0;
    const String signin = "s'enregistrer";
    const String dejacompte = "Tu as déjà un compte ?";
    const String login = "se connecter";
    Authentification auth = Authentification();
    var r = "";

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(forhei),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage("assets/logo.png"),
                  height: size.height * 0.25,
                ),
                Text(
                  "Bienvenue, crée ton compte YL",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: forhei - 10),
                  child: Form(
                    key: formstate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: mynameController,
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
                          controller: myemailController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "champ vide";
                            }
                          },
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
                          controller: myphoneController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "champ vide";
                            }
                          },
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
                          obscureText: true,
                          controller: mypasswordController,
                          validator: (val) {
                            if (val!.length < 8) {
                              return "le mot de passe doit contenir au minimum 8 caractères";
                            }
                            return null;
                          },
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
                          obscureText: true,
                          controller: mypasswordconfirmationController,
                          validator: (val) {
                            if (mypasswordController.text !=
                                mypasswordconfirmationController.text) {
                              return "les mots de passe ne sont pas identiques";
                            }
                            return null;
                          },
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
                        const SizedBox(
                          height: forhei - 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () async {
                                var formdata = formstate.currentState;
                                if (formdata!.validate()) {
                                  formdata.save();
                                  print('cest bon');
                                  var n = await auth.signup(
                                      formstate,
                                      myemailController.text,
                                      mypasswordController.text,
                                      mynameController.text,
                                      adresseController.text,
                                      myphoneController.text);
                                  print("re : $n");

                                  if (FirebaseAuth.instance.currentUser !=
                                      null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Menu(
                                                  indexx: 0,
                                                )));
                                  }
                                }
                              },
                              child: Text(
                                signin.toUpperCase(),
                                style: const TextStyle(color: Colors.black),
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
