import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projet_etudes/services/Cloudfirestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomePage1();
  }
}

class MyHomePage1 extends State<MyHomePage> {
  CloudFirestore fire = CloudFirestore();
  final List<String> collections = [
    'assets/collection korite23/photo6.jpg',
    'assets/collection korite23/photo1.jpg',
    'assets/collection korite23/photo10.jpg'
  ];

  var ett;

  var jour;

  TextEditingController searchController = TextEditingController();
  bool showloading = false;
  bool boolean = true;
  var couleur = Colors.white;
  var status;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            actions: const [],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, Colors.white])),
            ),
            title: const Text(
              "YaryLifestyle",
              style: TextStyle(color: Color.fromARGB(178, 0, 0, 0)),
            ),

            toolbarHeight: 50.7,
            // leading: Text("PG"),
            centerTitle: false,

            //shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(14),topRight: Radius.circular(0))),

            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: collections.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Container(
                            height: 600,
                            color: Colors.deepPurple[200],
                            child: ElevatedButton(
                              onPressed: () {
                                fire.addCollection(
                                    "yarry",
                                    "assets/collection korite23/photo6.jpg",
                                    DateTime.now());
                                print("C'est bon ");
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 130),
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                elevation: 1,
                                padding: const EdgeInsets.all(0),
                              ),
                              child: SizedBox(
                                  height: 600,
                                  width: 420,
                                  child: Image.asset(
                                    collections[index],
                                    fit: BoxFit.cover,
                                    height: 100,
                                  )),
                            )),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
