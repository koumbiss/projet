import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:projet_etudes/Fournisseur/AjoutArticles.dart';
import 'package:projet_etudes/Fournisseur/AjoutCollection.dart';
import 'package:projet_etudes/Fournisseur/Collections.dart';
import 'package:projet_etudes/Fournisseur/ReceptionCommande.dart';
import 'package:projet_etudes/Fournisseur/profilfournisseur.dart';
import 'package:projet_etudes/client/homepage.dart';
import 'package:projet_etudes/client/profile_screen.dart';

class MenuFournisseur extends StatefulWidget {
  final indexx;
  const MenuFournisseur({super.key, this.indexx});

  @override
  State<StatefulWidget> createState() {
    return MenuFournisseurState();
  }
}

class MenuFournisseurState extends State<MenuFournisseur> {
  int selectedindex = 0;
  final List pages = [
    const Collections(),
    const AJoutCollection(),
    const ReceptionCommande(),
    const ProfilFournisseur(),
  ];

  void selectedpage(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  void initState() {
    selectedindex = widget.indexx ?? 0;
    super.initState();
  }

  @override
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
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    onTap: selectedpage,
                    items: [
                      BottomNavigationBarItem(
                        label: "Home",
                        icon: Icon(selectedindex == 0
                            ? IconlyBold.home
                            : IconlyLight.home),
                      ),
                      BottomNavigationBarItem(
                        label: "collection",
                        icon: Icon(selectedindex == 1
                            ? Icons.collections_rounded
                            : Icons.collections_outlined),
                      ),
                      BottomNavigationBarItem(
                        label: "Reception",
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
