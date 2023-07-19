import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            //labelText: "E-mail",
                            hintText: "E-mail",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: forhei - 20,
                      ),
                      TextFormField(
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
                            onPressed: () {}, child: Text(login.toUpperCase())),
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                              onPressed: () {}, child: const Text(creComp))),
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
