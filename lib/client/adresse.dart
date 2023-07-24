import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_etudes/Fournisseur/AjoutArticles.dart';
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:projet_etudes/client/ArticleDetails.dart';
import 'package:projet_etudes/client/Menu.dart';

import 'package:projet_etudes/model/Article.dart';
import 'package:projet_etudes/model/Item.dart';
import 'package:projet_etudes/services/Cloudfirestore.dart';
import 'package:provider/provider.dart';

class adresse extends StatefulWidget {
  final idc;
  adresse({
    Key? key,
    this.idc,
  }) : super(key: key);

  State<StatefulWidget> createState() {
    return adresseState();
  }
}

class adresseState extends State<adresse> {
  final TextEditingController adressecontroler = TextEditingController();
  var couleur = Colors.white;
  CollectionReference produitref =
      FirebaseFirestore.instance.collection("Articles");
  List<Article> mesproduits = [];

  List<Article> mesproduits2 = [];
  var vert22 = Colors.white;
  bool boolean = true;
  double mmargin = 19;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ]))),

              // ignore: avoid_unnecessary_containers
              leading: Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    IconlyLight.arrowLeft2,
                    color: Color.fromARGB(255, 50, 50, 50),
                  ),
                ),
              ),
              toolbarHeight: 53.7,
              // leading: Text("PG"),
              centerTitle: true,

              //shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(14),topRight: Radius.circular(0))),
              // ignore: avoid_unnecessary_containers
              title: Container(
                  child: Text(
                "adresse",
                style: GoogleFonts.quicksand(
                  color: const Color.fromARGB(255, 58, 58, 58),
                  fontSize: 27,
                ),
              )),

              elevation: 0,
            ),
            resizeToAvoidBottomInset: true,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [Colors.white, Colors.white])),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                        controller: adressecontroler,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "champ vide";
                          } else if (val.length < 8) {
                            return "numero n'est pas valide";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          //  floatingLabelAlignment: FloatingLabelAlignment.center,
                          //  floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 116, 203, 232),
                                width: 1),
                            gapPadding: 0.2,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 244, 244, 244),
                                width: 1),
                          ),

                          label: Center(
                            child: Text(
                              "adresse ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 211, 211)),
                            ),
                          ),
                        )),
                    height: 50,
                    width: 260,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 7,
                              spreadRadius: -3,
                              color: Color.fromARGB(255, 210, 208, 208))
                        ],
                      ),
                      margin: EdgeInsets.only(left: 20, top: 12, bottom: 12),
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
                          onPressed: () async {
                            await CloudFirestore().updateadresse(
                              FirebaseAuth.instance.currentUser!.uid,
                              adressecontroler.text,
                            );
                          },
                          child: Text(
                            "ajouter",
                            style: GoogleFonts.quicksand(
                                fontSize: 22, color: Colors.white),
                          )))
                ],
              ),
            )));
  }
}
