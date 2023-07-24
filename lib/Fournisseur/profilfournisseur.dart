import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:projet_etudes/client/WelcomeScreen.dart';

import 'package:projet_etudes/client/loginScreen.dart';
import 'package:projet_etudes/client/mescommandes.dart';
import 'package:projet_etudes/client/parametre.dart';
import 'package:projet_etudes/client/splash_screen.dart';
import 'package:projet_etudes/services/Authentification.dart';

class ProfilFournisseur extends StatelessWidget {
  const ProfilFournisseur({super.key});

  @override
  Widget build(BuildContext context) {
    Authentification auth = Authentification();
    //final String profileImage = "assets/maybe.jpeg";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          margin: EdgeInsets.only(left: 170),
          child: Text(
            "profile",
            style: GoogleFonts.quicksand(fontSize: 20),
          ),
        ),
      ),
      body: FirebaseAuth.instance.currentUser == null
          ? Container(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 12,
                            spreadRadius: -4,
                            color: Color.fromARGB(255, 210, 210, 210))
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  width: 250,
                  height: 46,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Color.fromARGB(0, 29, 150, 142)),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => new loginScreen()));
                    },
                    child: Text("Se connecter",
                        style: GoogleFonts.mukta(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          : Container(
              child: SingleChildScrollView(
                child: StreamBuilder<Object>(
                    stream: FirebaseFirestore.instance
                        .collection("Fournisseur")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Text("${snapshot.data["nomUtilisateur"]}",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,

                                    color: Colors.black,
                                    //Theme.of(context).textTheme.labelLarge,
                                  ) //
                                  ),
                              const SizedBox(height: 20),
                              const SizedBox(height: 30),
                              const Divider(
                                color: Colors.black,
                              ),
                              const SizedBox(height: 10),
                              ProfileMenuWidget(
                                  title: "${snapshot.data["email"]}",
                                  icon: LineAwesomeIcons.mail_bulk,
                                  textColor: Colors.black,
                                  onPress: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ModificationScreen(
                                        champ: "email",
                                        value: snapshot.data["email"],
                                      );
                                    }));
                                  }),
                              ProfileMenuWidget(
                                  title: "${snapshot.data["telephone"]}",
                                  icon: LineAwesomeIcons.phone,
                                  textColor: Colors.black,
                                  onPress: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ModificationScreen(
                                        champ: "telephone",
                                        value: snapshot.data["telephone"],
                                      );
                                    }));
                                  }),
                              ProfileMenuWidget(
                                  title: "Mot de passe",
                                  icon: LineAwesomeIcons.fingerprint,
                                  textColor: Colors.black,
                                  onPress: () {}),
                              const Divider(color: Colors.black),
                              ProfileMenuWidget(
                                title: "Se déconnecter",
                                icon: LineAwesomeIcons.alternate_sign_out,
                                textColor: Colors.red,
                                endIcon: false,
                                onPress: () async {
                                  await auth.Logout();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return loginScreen();
                                  }));
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        title: Text(title,
            style:
                Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: const Icon(
                  LineAwesomeIcons.angle_right,
                  size: 18.0,
                  color: Colors.black,
                ),
              )
            : null);
  }
}
