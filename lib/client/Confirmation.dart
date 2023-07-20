import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:projet_etudes/services/Cloudfirestore.dart';

import 'package:provider/provider.dart';

class Confirmation extends StatefulWidget {
  final total;
  Confirmation({Key? key, this.total}) : super(key: key);
  State<StatefulWidget> createState() {
    return ConfirmationState();
  }
}

class ConfirmationState extends State<Confirmation> {
  int indexx = 0;
  var totale;
  bool livraison = false;
  var btmColors2 = Colors.white;
  // var btmColors22 = Colors.black;
  var textColor2 = Color.fromARGB(255, 0, 0, 0);
  var textColor1 = Color.fromARGB(255, 0, 0, 0);
  var btmColors1 = Color.fromARGB(255, 251, 251, 251);
  //var btmColors11 = Color.fromARGB(255, 251, 251, 251);
  List<String> listype = [];
  var selected;
  bool b1 = false;
  bool b2 = true;
  CollectionReference ref = FirebaseFirestore.instance.collection("Pharmacies");
  @override
  void initState() {
    print(" mes donnees : ${widget.total}");

    totale = widget.total;
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            actions: [],
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.white]))),

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
            toolbarHeight: 52.7,
            // leading: Text("PG"),
            centerTitle: true,

            //shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(14),topRight: Radius.circular(0))),
            title: Container(
                child: Text(
              "passez la commande",
              style: GoogleFonts.quicksand(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
              ),
            )),

            elevation: 0,
          ),
          body: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 255, 255, 255)),
                      color: Colors.white),
                  width: 300,
                  height: 30,
                  margin:
                      EdgeInsets.only(right: 10, left: 5, top: 20, bottom: 0),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    "Reference de la commande: 301A",
                    style: GoogleFonts.quicksand(
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Consumer<Cart>(builder: ((context, value, child) {
                        if (value.selectedproduct.length == 0) {
                          return Container(
                            child: Center(
                                child: Text("aucun produit dans votre panier")),
                          );
                        } else {
                          return Row(
                            children: [
                              Container(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black),
                                        color: Colors.white),
                                    width: 200,
                                    margin: EdgeInsets.only(
                                        right: 10,
                                        left: 50,
                                        top: 20,
                                        bottom: 0),
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: DropdownButton(
                                      icon: Icon(Icons.payment),
                                      dropdownColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      hint: Text(
                                        "mode de paiement",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0)),
                                      ),
                                      items: ["Bankily", "Massrivi"]
                                          .map((e) => DropdownMenuItem(
                                                child: Text("$e",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 19, 18, 18))),
                                                value: e,
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          selected = val;
                                          //   len = int.parse(val.toString());
                                        });
                                      },
                                      value: selected,
                                      style: TextStyle(color: Colors.white),
                                      isExpanded: true,
                                    )),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      color: Colors.white),
                                  width: 100,
                                  height: 30,
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 20, bottom: 0),
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    "36892763",
                                    style: GoogleFonts.quicksand(fontSize: 20),
                                  )),
                            ],
                          );
                        }
                      })),
                      Container(
                          padding: EdgeInsets.only(
                              left: 40, top: 30, right: 40, bottom: 10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "TOTAL A PAYER ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    " ${totale} Mro ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 0,
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(0),
                      height: 70,
                      width: 340,
                      child: Consumer<Cart>(builder: ((context, value, child) {
                        return Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 7,
                                    spreadRadius: -3,
                                    color: Color.fromARGB(255, 210, 208, 208))
                              ],
                            ),
                            margin:
                                EdgeInsets.only(left: 20, top: 12, bottom: 12),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                ),
                                onPressed: () {
                                  print("this is my liste $listype");
                                },
                                child: Text(
                                  "Confirmer la commande",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 22, color: Colors.white),
                                )));
                      })),
                    ))
              ],
            ),
          ),
        ));
  }
}
