import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:projet_etudes/client/Menu.dart';

import 'package:provider/provider.dart';

class ArticleDetails extends StatefulWidget {
  final Reference, item, image, nom, prix, quantite, description;

  ArticleDetails(
      {Key? key,
      this.Reference,
      this.item,
      this.image,
      this.nom,
      this.quantite,
      this.description,
      this.prix})
      : super(key: key);
  State<StatefulWidget> createState() {
    return ArticleDetailsState();
  }
}

class ArticleDetailsState extends State<ArticleDetails> {
  var couleur = Colors.white;
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              actions: [
                Row(children: [
                  Consumer<Cart>(builder: ((context, value, child) {
                    return Stack(children: [
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menu(indexx: 1)));
                            },
                            icon: Icon(Icons.shopping_bag_rounded,
                                color: Colors.black)),
                      ),
                      Positioned(
                          top: 2,
                          left: 30,
                          child: Container(
                            height: 20,
                            width: 30,
                            child: Text(
                              " ${value.qte}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(99, 224, 224, 224)),
                          )),
                    ]);
                  }))
                ])
              ],
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
              toolbarHeight: 53.7,
              // leading: Text("PG"),
              centerTitle: true,

              //shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(14),topRight: Radius.circular(0))),

              elevation: 0,
            ),
            body: Container(
              color: couleur,
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, bottom: 5, top: 0, right: 0),
                        width: 430,
                        height: 490,
                        decoration: BoxDecoration(
                          color: couleur,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(121, 168, 168, 168),
                                blurRadius: 8,
                                spreadRadius: -1),
                          ],
                          image: DecorationImage(
                              image: NetworkImage(widget.image),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              bottomLeft: Radius.circular(0),
                              topLeft: Radius.circular(0)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 5, bottom: 0, top: 0, right: 0),
                    width: double.infinity,
                    height: 300,
                    color: couleur,
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 250,
                                    margin: EdgeInsets.only(left: 10, top: 0),
                                    child: Text(widget.nom,
                                        maxLines: 2,
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 19))),
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Text("${widget.prix} Mru",
                                        style: GoogleFonts.quicksand(
                                            color: Colors.black, fontSize: 20)))
                              ],
                            ),
                            Container(
                              width: 160,
                              height: 35,
                              margin: EdgeInsets.only(left: 10, top: 10),
                              // padding: EdgeInsets.only(left: 30, right: 30),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                width: 1,
                              )),

                              child: Consumer<Cart>(
                                  builder: ((context, instance, child) {
                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(230, 50),
                                      elevation: 0,
                                      primary: Color.fromARGB(0, 255, 255, 255),
                                      padding: EdgeInsets.all(0),
                                    ),
                                    onPressed: () {
                                      print(" id : ${widget.Reference}");

                                      int q = 1;

                                      for (int i = 0;
                                          i < instance.selectedproduct.length;
                                          i++) {
                                        print(
                                            " quantite item : ${widget.quantite}");
                                        print(
                                            " quantite selected : ${instance.selectedproduct[i].quantite}");
                                        if (instance.selectedproduct[i]
                                                .referenceArticle ==
                                            widget.item.referenceArticle) {
                                          if (instance
                                                  .selectedproduct[i].quantite <
                                              widget.quantite) {
                                            instance.quantite(
                                                instance.selectedproduct[i]);

                                            1;
                                            instance.quantiteTotal();

                                            instance.pricee(
                                                instance.selectedproduct[i],
                                                widget.prix);
                                            q++;

                                            instance.prices(
                                              widget.prix,
                                            );
                                          } else {
                                            final snackBar = SnackBar(
                                              content: Text(
                                                  'quantite non disponible'),
                                              backgroundColor: Color.fromARGB(
                                                  255, 234, 132, 124),
                                            );

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            q++;
                                          }
                                        }
                                      }
                                      print(q);
                                      if (q == 1) {
                                        instance.add(widget.item);

                                        instance.quantiteTotal();
                                        instance.prices(widget.item.prix);
                                      }
                                      print("${instance.selectedproduct}");
                                    },
                                    child: Text("Ajouter au Panier",
                                        style: GoogleFonts.quicksand(
                                            color: Colors.black,
                                            fontSize: 17)));
                              })),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
