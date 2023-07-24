import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_etudes/Fournisseur/MenuFournisseur.dart';
import 'package:projet_etudes/client/Menu.dart';
import 'package:projet_etudes/client/sign_in_screen.dart';
import 'package:projet_etudes/services/Authentification.dart';
import 'package:projet_etudes/services/Cloudfirestore.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final memailController = TextEditingController();
    final mpasswordController = TextEditingController();
    const String login = "se connecter";
    const String loginCon = "Connecte toi ou crée ton compte YL";
    const String logo = "assets/logo.png";
    const String creComp = " Créer un compte";
    final size = MediaQuery.of(context).size;
    const forhei = 30.0;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(forhei),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Image(
                  image: const AssetImage(logo),
                  height: size.height * 0.3,
                ),
                Text(
                  loginCon,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Form(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: forhei - 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: memailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            //labelText: "E-mail",
                            hintText: "E-mail",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: forhei - 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: mpasswordController,
                        decoration: const InputDecoration(
                          //labelText: "Mot de passe",
                          prefixIcon: Icon(Icons.fingerprint),
                          hintText: "Mot de passe",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: forhei - 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              var us = await Authentification().signinn(
                                  memailController, mpasswordController);

                              print("reponse $us");

                              if (us == "true") {
                                var idd =
                                    FirebaseAuth.instance.currentUser!.uid;

                                await CloudFirestore()
                                    .getTypeuser(idd)
                                    .then((value) {
                                  return Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return value == true
                                        ? Menu(
                                            indexx: 0,
                                          )
                                        : MenuFournisseur(
                                            indexx: 0,
                                          );
                                  }));
                                });
                              }

                              if (us == 'true') {
                                print("c'est bon");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu(indexx: 0)));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Text(
                              login.toUpperCase(),
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
                                  builder: (context) => const SignInScreen()),
                            );
                          },
                          child: const Text("crée un nouveau compte")),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
