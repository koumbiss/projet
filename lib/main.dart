import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projet_etudes/Fournisseur/MenuFournisseur.dart';
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:projet_etudes/client/Menu.dart';
import 'package:projet_etudes/client/WelcomeScreen.dart';

import 'package:projet_etudes/client/homepage.dart';
import 'package:projet_etudes/client/loginScreen.dart';
import 'package:projet_etudes/client/profile_screen.dart';
import 'package:projet_etudes/client/sign_in_screen.dart';
import 'package:projet_etudes/client/splash_screen.dart';
import 'package:projet_etudes/services/Cloudfirestore.dart';
import 'package:provider/provider.dart';

import 'client/Menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
      create: ((context) {
        return Cart();
      }),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var n;
    if (user != null) {
      n = CloudFirestore().getTypeuser(user.uid);
    } else
      print("aucun utilisateur est connecte");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
        home: user != null
            ? n == true
                ? Menu(
                    indexx: 0,
                  )
                : MenuFournisseur(
                    indexx: 0,
                  )
            : WelcomeScreen());
  }
}
