import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:projet_etudes/services/Cloudfirestore.dart';

import 'package:provider/provider.dart';

class detailscommande extends StatefulWidget {
  final livraison, Idclient, id, dateCommande, total, etatCommande;
  detailscommande({
    Key? key,
    this.livraison,
    this.id,
    this.Idclient,
    this.dateCommande,
    this.total,
    this.etatCommande,
  }) : super(key: key);

  State<StatefulWidget> createState() {
    return detailscommandeState();
  }
}

class detailscommandeState extends State<detailscommande> {
  bool visible = false;
  var etat;
  bool annule = false;
  @override
  void initState() {
    bool visible = false;
    super.initState();
  }

  var frais;

  //CollectionReference ref = FirebaseFirestore.instance.collection("Clients");
  var totale;
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    IconlyLight.arrowLeft2,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
              ),
              flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.white, Colors.white]))),
              toolbarHeight: 52.7,
              centerTitle: true,
              title: Container(
                  child: Text(
                "Commande : ${widget.id}",
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
                child: ListView(shrinkWrap: true, children: [
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Commandes")
                          .doc("${widget.id}")
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          etat = snapshot.data['etatCommande'];
                          return Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 0),
                                  decoration: BoxDecoration(),
                                  child: Text(
                                      "  ${snapshot.data['etatCommande']}  ",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  StreamBuilder<Object>(
                      stream: FirebaseFirestore.instance
                          .collection("Paiements")
                          .where("idcommande", isEqualTo: "${widget.id}")
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          print("${snapshot.data.docs.length}");
                          print("${widget.id}");
                          return Container(
                            margin: EdgeInsets.only(
                                top: 15, bottom: 15, left: 0, right: 0),
                            padding: EdgeInsets.all(10),
                            width: 350,
                            color: Color.fromARGB(255, 255, 255, 255),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Paiement",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 67, 67, 67)),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 67, 67, 67)),
                                      ),
                                      Text(
                                          "${DateFormat('yyyy/MM/dd kk:mm').format((widget.dateCommande).toDate())}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 67, 67, 67)))
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("compte de paiement:",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 67, 67, 67))),
                                      Text(
                                          "${snapshot.data.docs[0].data()[' comptePaiement']}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 67, 67, 67)))
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("reference",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 67, 67, 67))),
                                            Text(
                                                "${snapshot.data.docs[0]['idPaiement']}",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 67, 67, 67)))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "total paye",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 67, 67, 67)),
                                            ),
                                            Text("${widget.total} MRU",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 67, 67, 67)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                    padding: EdgeInsets.only(left: 40, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 0),
                          child: Text(
                            "Articles",
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("Commandes")
                                .doc("${widget.id}")
                                .collection("Item")
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                    margin: EdgeInsets.only(left: 0),
                                    child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data.docs.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        childAspectRatio: 2.7,
                                        mainAxisSpacing: 2,
                                      ),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                            top: 10,
                                            left: 0,
                                            right: 20,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          height: 120,
                                          child: Row(children: [
                                            Expanded(
                                              child: Container(
                                                height: 150,
                                                margin: EdgeInsets.only(top: 0),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            121, 168, 168, 168),
                                                        blurRadius: 15,
                                                        spreadRadius: -7),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(90),
                                                    bottomRight:
                                                        Radius.circular(90),
                                                    topLeft:
                                                        Radius.circular(90),
                                                    bottomLeft:
                                                        Radius.circular(90),
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                    child: SizedBox(
                                                  height: double.infinity,
                                                  child: Image.network(
                                                    "${snapshot.data.docs[index].data()['image']}",
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                  ),
                                                )),
                                              ),
                                            ),
                                            Expanded(
                                                child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 12, right: 20),
                                                  width: 200,
                                                  child: Text(
                                                    snapshot.data.docs[index]
                                                        .data()['nomArticle'],
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        GoogleFonts.quicksand(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: 17),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0, left: 10),
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                            " ${snapshot.data.docs[index].data()['quantite']} x",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .quicksand(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            34,
                                                                            34,
                                                                            34),
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0, right: 20),
                                                        width: 90,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                            " ${snapshot.data.docs[index].data()['prix']} MRU",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .quicksand(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                  ],
                                                )
                                              ],
                                            ))
                                          ]),
                                        );
                                      },
                                    ));
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 200,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 20, bottom: 10),
                                      decoration: BoxDecoration(),
                                      child: Text("Total :",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.quicksand(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(),
                                      child: Text("${widget.total} MRU ",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.quicksand(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]))));
  }
}
