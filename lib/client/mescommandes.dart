import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_etudes/client/CommandeDetails.dart';
import 'package:projet_etudes/client/detailscommande.dart';
import 'package:projet_etudes/services/Authentification.dart';

class mescommandes extends StatefulWidget {
  const mescommandes({super.key});

  @override
  State<StatefulWidget> createState() {
    return mescommandesState();
  }
}

class mescommandesState extends State<mescommandes> {
  Authentification auth = Authentification();
  TextEditingController searchControl = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection("Pharmacies");
  List<bool> traite = [];
  List<bool> traitementfinal = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white, Colors.white]))),
                toolbarHeight: 52.7,
                leading: Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      IconlyLight.arrowLeft2,
                      color: Color.fromARGB(255, 87, 87, 87),
                    ),
                  ),
                ),
                centerTitle: true,
                title: Container(
                    child: Text(
                  "Reception des Commandes ",
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                )),
                elevation: 0,
              ),
              body: Container(
                height: double.infinity,
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Commandes")
                              .snapshots(),
                          builder: (context, AsyncSnapshot snapshot) {
                            traite.clear();
                            traitementfinal.clear();
                            if (snapshot.hasData) {
                              if (snapshot.data.docs.length == 0) {
                                if (searchControl.text.isEmpty) {
                                  return const Center(
                                      child: Text(
                                          "vous n'avez aucune  commande  "));
                                } else {
                                  return const Center(
                                      child: Text("aucun resultat"));
                                }
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  if (snapshot.data.docs[index]
                                              .data()['etatCommande'] ==
                                          "livrée" ||
                                      snapshot.data.docs[index]
                                              .data()['etatCommande'] ==
                                          "retirée" ||
                                      snapshot.data.docs[index]
                                              .data()['etatCommande'] ==
                                          "confirmée" ||
                                      snapshot.data.docs[index]
                                          .data()['etatCommande']
                                          .contains("refusé")) {
                                    if (snapshot.data.docs[index]
                                                .data()['etatCommande'] ==
                                            "livrée" ||
                                        snapshot.data.docs[index]
                                                .data()['etatCommande'] ==
                                            "retirée") {
                                      traitementfinal.add(true);
                                    } else {
                                      traitementfinal.add(false);
                                    }
                                    traite.add(true);

                                    print(
                                        " etat $index : ${snapshot.data.docs[index].data()['etatCommande']}");
                                    print("traite $index: ${traite[index]}");
                                    print(
                                        "traite final $index: ${traitementfinal[index]}");
                                  } else {
                                    traitementfinal.add(false);
                                    print(
                                        "traite final $index: ${traitementfinal[index]}");
                                    traite.add(false);
                                    print(
                                        " etat $index: ${snapshot.data.docs[index].data()['etatCommande']}");
                                    print("traite  $index: ${traite[index]}");
                                  }

                                  print(
                                      "liste of traiement final $traitementfinal");
                                  print("liste of traiement  $traite");

                                  return Container(
                                    child: ListTile(
                                      onTap: () {},
                                      leading: Text("${index + 1}"),
                                      trailing: Container(
                                        margin: EdgeInsets.only(left: 80),
                                        child: ElevatedButton(
                                            child:
                                                Icon(Icons.arrow_outward_sharp),
                                            onPressed: () {
                                              print(
                                                  "${snapshot.data.docs[index].data()['totalCommande']}");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          detailscommande(
                                                            Idclient: snapshot
                                                                    .data
                                                                    .docs[index]
                                                                    .data()[
                                                                'Idclient'],
                                                            dateCommande: snapshot
                                                                    .data
                                                                    .docs[index]
                                                                    .data()[
                                                                'dateCommande'],
                                                            etatCommande: snapshot
                                                                    .data
                                                                    .docs[index]
                                                                    .data()[
                                                                'etatCommande'],
                                                            id: snapshot.data
                                                                    .docs[index]
                                                                    .data()[
                                                                'idCommande'],
                                                            livraison: snapshot
                                                                    .data
                                                                    .docs[index]
                                                                    .data()[
                                                                'modelivraison'],
                                                            total: snapshot.data
                                                                    .docs[index]
                                                                    .data()[
                                                                'totalCommande'],
                                                          )));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              // fixedSize: Size(250, 250),
                                              elevation: 0,
                                              // padding: EdgeInsets.all(0),
                                              primary: Color.fromARGB(
                                                  0, 255, 255, 255),
                                              padding: EdgeInsets.all(0),
                                            )),
                                        // margin: EdgeInsets.only(left: 10, top: 200, bottom: 40),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 71, 196, 159),
                                          // borderRadius: BorderRadius.circular(70),
                                        ),
                                        width: 30,

                                        height: 30,
                                      ),
                                      title: Text(
                                          style: GoogleFonts.quicksand(
                                            color: const Color.fromARGB(
                                                255, 72, 72, 72),
                                          ),
                                          " reference : ${snapshot.data.docs[index].data()['idCommande']} MD:${snapshot.data.docs[index].data()['modelivraison']}"),
                                      subtitle: snapshot.data.docs[index]
                                              .data()['etatCommande']
                                              .contains("refusée")
                                          ? const Text(
                                              "refusé",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 228, 52, 52),
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              "${snapshot.data.docs[index].data()['etatCommande']}",
                                              style: GoogleFonts.quicksand(
                                                color: const Color.fromARGB(
                                                    255, 72, 72, 72),
                                              ),
                                            ),
                                    ),
                                  );
                                },
                              );
                            }

                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            )));
  }
}
