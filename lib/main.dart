import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
import 'package:projet_etudes/client/WelcomeScreen.dart';

=======
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:projet_etudes/client/Menu.dart';

import 'package:projet_etudes/client/homepage.dart';
import 'package:provider/provider.dart';
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337

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
<<<<<<< HEAD
      home: const WelcomeScreen(),
=======
      home: Menu(indexx: 1),
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
    );
  }
}
