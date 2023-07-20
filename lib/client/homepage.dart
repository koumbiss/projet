import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:projet_etudes/Fournisseur/AjoutArticles.dart';
import 'package:projet_etudes/client/Articles.dart';
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

  // ignore: prefer_typing_uninitialized_variables
  var ett;

  // ignore: prefer_typing_uninitialized_variables
  var jour;

  TextEditingController searchController = TextEditingController();
  bool showloading = false;
  bool boolean = true;
  var couleur = Colors.white;
  // ignore: prefer_typing_uninitialized_variables
  var status;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: StreamBuilder<Object>(
                        stream: FirebaseFirestore.instance
                            .collection("Collections")
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1.0),
                                    child: Container(
                                        height: 580,
                                        color: const Color.fromARGB(
                                            255, 226, 223, 232),
                                        child: Stack(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            Articles(
                                                              nomcollection: snapshot
                                                                          .data
                                                                          .docs[
                                                                      index][
                                                                  "nomCollection"],
                                                              idc: snapshot
                                                                  .data
                                                                  .docs[index]
                                                                  .id,
                                                            )));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(410, 580),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                elevation: 1,
                                                padding:
                                                    const EdgeInsets.all(0),
                                              ),
                                              child: SizedBox(
                                                  height: 600,
                                                  width: 420,
                                                  child: Image.network(
                                                    snapshot.data.docs[index]
                                                        ["image"],
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                  )),
                                            ),
                                            Positioned(
                                              right: 0,
                                              left: 0,
                                              bottom: 0,
                                              child: Container(
                                                width: 200,
                                                height: 50,
                                                padding: const EdgeInsets.only(
                                                    left: 150, top: 15),
                                                color: const Color.fromARGB(
                                                    47, 255, 255, 255),
                                                child: Text(
                                                  "${snapshot.data.docs[index]["nomCollection"]}",
                                                  style: GoogleFonts.bebasNeue(
                                                      fontSize: 20,
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                          const Color.fromRGBO(
                                                              255,
                                                              255,
                                                              255,
                                                              1)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  );
                                });
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ),
                  // Container(
                  //   width: 400,
                  //   height: 30,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => AJoutArticles(
                  //                     idcollection: "dNxPfFLCS8kYCpF92550",
                  //                   )));
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       fixedSize: const Size(20, 20),
                  //       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  //       elevation: 0,
                  //       padding: const EdgeInsets.all(0),
                  //     ),
                  //     child: Icon(
                  //       Icons.add,
                  //       color: Color.fromARGB(255, 31, 30, 30),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Positioned(
                right: 20,
                left: 30,
                top: 20,
                child: Text(
                  "Yarylifestyle",
                  style: GoogleFonts.bebasNeue(
                      fontSize: 40,
                      //fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(255, 255, 255, 0.694)),
                ),
              ),
            ],
          ),
        ));
  }
}
