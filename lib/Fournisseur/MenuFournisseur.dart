import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:projet_etudes/Fournisseur/AjoutArticles.dart';
import 'package:projet_etudes/Fournisseur/AjoutCollection.dart';
import 'package:projet_etudes/Fournisseur/Homepage.dart';
import 'package:projet_etudes/Fournisseur/ReceptionCommande.dart';
import 'package:projet_etudes/client/Articles.dart';
import 'package:projet_etudes/client/Panier.dart';
import 'package:projet_etudes/client/homepage.dart';

class MenuFournisseur extends StatefulWidget {
  final indexx;
  MenuFournisseur({super.key, this.indexx});

  State<StatefulWidget> createState() {
    return MenuFournisseurState();
  }
}

class MenuFournisseurState extends State<MenuFournisseur> {
  int selectedindex = 0;
  final List pages = [
    MyHomePage(),
    AJoutCollection(),
    ReceptionCommande(),
    AJoutArticles(),
  ];

  void selectedpage(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  void initState() {
    selectedindex = widget.indexx == null ? 0 : widget.indexx;
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                    elevation: 0,
                    unselectedItemColor: Colors.black,
                    selectedItemColor: Colors.black,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: selectedindex,
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    onTap: selectedpage,
                    items: [
                      BottomNavigationBarItem(
                        label: "Home",
                        icon: Icon(selectedindex == 0
                            ? IconlyBold.home
                            : IconlyLight.home),
                      ),
                      BottomNavigationBarItem(
                        label: "Panier",
                        icon: Icon(selectedindex == 1
                            ? Icons.collections_rounded
                            : Icons.collections_outlined),
                      ),
                      BottomNavigationBarItem(
                        label: "Home",
                        icon: Icon(selectedindex == 2
                            ? Icons.message
                            : Icons.message_outlined),
                      ),
                      BottomNavigationBarItem(
                        label: "compte",
                        icon: Icon(selectedindex == 3
                            ? IconlyBold.profile
                            : IconlyLight.profile),
                      ),
                    ]),
                body: pages[selectedindex])));
  }
}
