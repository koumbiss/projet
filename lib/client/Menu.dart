import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:projet_etudes/client/Panier.dart';
import 'package:projet_etudes/client/homepage.dart';
import 'package:projet_etudes/client/profile_screen.dart';

class Menu extends StatefulWidget {
  final indexx;
  const Menu({super.key, this.indexx});

  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  int selectedindex = 0;
  final List pages = [
    const MyHomePage(),
    const Panier(),
    const ProfileScreen(),
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
            length: 3,
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
                        label: "Panier",
                        icon: Icon(selectedindex == 1
                            ? Icons.shopping_bag
                            : Icons.shopping_bag_outlined),
                      ),
                      BottomNavigationBarItem(
                        label: "compte",
                        icon: Icon(selectedindex == 2
                            ? IconlyBold.profile
                            : IconlyLight.profile),
                      ),
                    ]),
                body: pages[selectedindex])));
  }
}
