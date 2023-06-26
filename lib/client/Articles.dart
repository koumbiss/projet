import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:projet_etudes/Provider/Cart.dart';

import 'dart:math' as math;

import 'package:projet_etudes/model/Article.dart';
import 'package:provider/provider.dart';

import '../model/Item.dart';

class Articles extends StatefulWidget {
  final id, idc, nom, photo, categorie;
  Articles({Key? key, this.idc, this.id, this.categorie, this.nom, this.photo})
      : super(key: key);
  State<StatefulWidget> createState() {
    return ArticlesState();
  }
}

class ArticlesState extends State<Articles> {
  final TextEditingController searchControl = TextEditingController();
  var couleur = Colors.white;
  CollectionReference produitref =
      FirebaseFirestore.instance.collection("Articles");
  List<Article> mesproduits = [];

  List<Article> mesproduits2 = [];
  var vert22 = Colors.white;
  bool boolean = true;
  double mmargin = 19;
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
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => bottombar(
                              //               indexx: 1,
                              //             )));
                            },
                            icon: Icon(Icons.shopping_cart_rounded,
                                color: vert22)),
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
                                  color: vert22),
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
              title: Container(
                  child: Text(
                "widget.categorie",
                style: TextStyle(
                    color: vert22,
                    fontSize: 27,
                    fontFamily: "",
                    fontWeight: FontWeight.bold),
              )),

              elevation: 0,
            ),
            resizeToAvoidBottomInset: true,
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [Colors.white, Colors.white])),
              child: ListView(children: [
                Column(
                  children: [
                    StreamBuilder(
                        stream: !boolean
                            ? FirebaseFirestore.instance
                                .collection("Categories")
                                .doc(widget.idc)
                                .collection("Produits")
                                .where("marque", isEqualTo: "")
                                .snapshots()
                            : FirebaseFirestore.instance
                                .collection("Categories")
                                .doc(widget.idc)
                                .collection("Produits")
                                .where("marque", isEqualTo: searchControl.text)
                                .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          print("len2 1: ${mesproduits2.length} ");
                          mesproduits2.clear();
                          print("len2 2: ${mesproduits2.length} ");
                          if (snapshot.hasData) {
                            print("len snapshot :${snapshot.data.docs.length}");

                            for (int i = 0;
                                i < snapshot.data.docs.length;
                                i++) {
                              mesproduits2.add(Article(
                                  referenceArticle: snapshot.data.docs[i].id,
                                  collection: snapshot.data.docs[i]
                                      .data()['referenceArticle'],
                                  description: snapshot.data.docs[i]
                                      .data()['description'],
                                  image: snapshot.data.docs[i].data()['image'],
                                  nomArticle: snapshot.data.docs[i]
                                      .data()['nomArticle'],
                                  disponibilite: snapshot.data.docs[i]
                                      .data()['disponibilite'],
                                  prix: snapshot.data.docs[i].data()['prix'],
                                  quantite: snapshot.data.docs[i]
                                      .data()['quantite']));
                            }
                            print("len2 : ${mesproduits2.length} ");

                            return Container();
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                    Row(
                      children: [
                        Container(
                            width: 300,
                            margin:
                                EdgeInsets.only(top: 10, bottom: 20, left: 30),
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print("search : $value");
                                print("search : ${searchControl.text}");
                              },
                              controller: searchControl,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "chercher un produit",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 136, 136, 136)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(0, 213, 245, 226)),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(60),
                                          bottomLeft: Radius.circular(60),
                                          bottomRight: Radius.circular(0),
                                          topRight: Radius.circular(0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(0, 222, 222, 222),
                                  )),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 250, 250, 250),
                                  contentPadding: const EdgeInsets.all(15.5)),
                            )),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 250, 250),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(60),
                                topRight: Radius.circular(60)),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (searchControl.text.isEmpty) {
                                setState(() {
                                  boolean = false;
                                });
                              } else
                                setState(() {
                                  boolean = true;
                                });
                            },
                            icon: Icon(Icons.search),
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 10, top: 200, bottom: 40),
                      decoration: BoxDecoration(
                        color: couleur,
                        // borderRadius: BorderRadius.circular(70),
                      ),

                      height: 525,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                          ),
                          Container(
                              width: 400,
                              padding: EdgeInsets.only(left: 10, right: 20),
                              child: ListView(
                                children: [
                                  StreamBuilder(
                                      stream: !boolean ||
                                              searchControl.text.isEmpty
                                          ? FirebaseFirestore.instance
                                              .collection("Categories")
                                              .doc(widget.idc)
                                              .collection("Produits")
                                              .snapshots()
                                          : FirebaseFirestore.instance
                                              .collection("Categories")
                                              .doc(widget.idc)
                                              .collection("Produits")
                                              .where("nom",
                                                  isEqualTo: searchControl.text)
                                              .snapshots(),
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        // if (snapshot.data.docs.length == 0) {
                                        //   return Center(
                                        //       child: Text(
                                        //           "Il n'ya pas encore de produits"));
                                        // }
                                        if (snapshot.hasData) {
                                          if (!boolean) {
                                            mesproduits2.clear();
                                          }
                                          mesproduits.clear();

                                          for (int i = 0;
                                              i < snapshot.data.docs.length;
                                              i++) {
                                            mesproduits.add(Article(
                                                referenceArticle:
                                                    snapshot.data.docs[i].id,
                                                collection: snapshot
                                                    .data.docs[i]
                                                    .data()['referenceArticle'],
                                                description: snapshot
                                                    .data.docs[i]
                                                    .data()['description'],
                                                image: snapshot.data.docs[i]
                                                    .data()['image'],
                                                nomArticle: snapshot
                                                    .data.docs[i]
                                                    .data()['nomArticle'],
                                                disponibilite: snapshot
                                                    .data.docs[i]
                                                    .data()['disponibilite'],
                                                prix: snapshot.data.docs[i]
                                                    .data()['prix'],
                                                quantite: snapshot.data.docs[i]
                                                    .data()['quantite']));
                                          }
                                          mesproduits.addAll(mesproduits2);
                                          print(
                                              "len mesproduits : ${mesproduits.length} ");

                                          return GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: mesproduits.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            1),
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 2,
                                              ),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                var image;
                                                var nom;
                                                var contenuN;
                                                var marque;
                                                var quantite;
                                                var prix;
                                                var description;
                                                var collection;
                                                var disponibilte;

                                                image =
                                                    mesproduits[index].image;
                                                collection = mesproduits[index]
                                                    .collection;
                                                nom = mesproduits[index]
                                                    .nomArticle;

                                                marque = mesproduits[index]
                                                    .collection;
                                                quantite =
                                                    mesproduits[index].quantite;
                                                prix = mesproduits[index].prix;
                                                description = mesproduits[index]
                                                    .description;

                                                disponibilte =
                                                    mesproduits[index]
                                                        .disponibilite;

                                                Item a = Item(
                                                  referenceArticle:
                                                      mesproduits[index]
                                                          .referenceArticle,
                                                  disponibilite: disponibilte,
                                                  nomArticle: nom,
                                                  prixunitaire: prix,
                                                  collection: collection,
                                                  description: description,
                                                  image: image,
                                                  quantite: 1,
                                                  prix: prix,
                                                );
                                                print(
                                                    "lenght nom ${nom.length}");

                                                print(
                                                    "lenght marge ${mmargin}");

                                                return Container(
                                                  // height: 200,

                                                  margin: EdgeInsets.only(
                                                      left: 10,
                                                      top: 10,
                                                      right: 10,
                                                      bottom: 10),

                                                  padding: EdgeInsets.all(10),

                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Color.fromARGB(
                                                              121,
                                                              168,
                                                              168,
                                                              168),
                                                          blurRadius: 15,
                                                          spreadRadius: -7),
                                                    ],
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    90),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    90),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    90),
                                                            topLeft:
                                                                Radius.circular(
                                                                    90)),
                                                  ),

                                                  child: Column(
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            print(nom);
                                                            print(marque);
                                                            print(prix);
                                                            print(description);
                                                            print(widget.id);
                                                            print(widget.nom);
                                                            print(widget.photo);

                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //         builder: (context) => ProduitDetails(
                                                            //             item: a,
                                                            //             quantite:
                                                            //                 mesproduits[index]
                                                            //                     .quantite,
                                                            //             colletion:
                                                            //                 mesproduits[index]
                                                            //                     .collection,
                                                            //             referenceproduit:
                                                            //                 mesproduits[index]
                                                            //                     .referenceArticle,
                                                            //             image:
                                                            //                 image,
                                                            //             disponibilite:
                                                            //                 mesproduits[index]
                                                            //                     .disponibilite,
                                                            //             name: widget
                                                            //                 .nom,
                                                            //             photo: widget
                                                            //                 .photo,
                                                            //             nom:
                                                            //                 nom,
                                                            //             prix:
                                                            //                 prix,
                                                            //             description:
                                                            //                 description)));
                                                          },
                                                          child: Stack(
                                                            children: [
                                                              image == null
                                                                  ? CircleAvatar(
                                                                      backgroundColor: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                        "lib/images/imagevide.jpg",
                                                                      ),
                                                                      radius:
                                                                          80,
                                                                    )
                                                                  : CircleAvatar(
                                                                      backgroundColor: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                      backgroundImage:
                                                                          NetworkImage(
                                                                        image,
                                                                      ),
                                                                      radius:
                                                                          80,
                                                                    ),
                                                              snapshot.data.docs[index]
                                                                              .data()[
                                                                          'quantite'] ==
                                                                      0
                                                                  ? Positioned(
                                                                      top: 50,
                                                                      left: 0,
                                                                      child:
                                                                          Container(
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                10,
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                5,
                                                                            right:
                                                                                10),
                                                                        color: Color.fromARGB(
                                                                            136,
                                                                            193,
                                                                            193,
                                                                            193),
                                                                        child:
                                                                            Text(
                                                                          " non disponible ",
                                                                          style:
                                                                              TextStyle(color: Color.fromARGB(255, 140, 7, 7)),
                                                                        ),
                                                                      ))
                                                                  : Container()
                                                            ],
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize:
                                                                Size(120, 120),
                                                            elevation: 1,
                                                            // padding: EdgeInsets.all(0),
                                                            primary:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            90)),
                                                          )),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                              nom == null
                                                                  ? ""
                                                                  : nom,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      17))),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                              marque == null
                                                                  ? ""
                                                                  : marque,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      14))),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                              contenuN == null
                                                                  ? ""
                                                                  : "$contenuN",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      13))),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 5),
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  blurRadius:
                                                                      18,
                                                                  spreadRadius:
                                                                      -3,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          230,
                                                                          230,
                                                                          230))
                                                            ],
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 2,
                                                                bottom: 2,
                                                                left: 2,
                                                                right: 2),
                                                        width: 240,
                                                        child: Text(
                                                            prix == null
                                                                ? ""
                                                                : "$prix Mro",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      snapshot.data.docs[index]
                                                                      .data()[
                                                                  'quantite'] ==
                                                              0
                                                          ? Container()
                                                          : Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 40,
                                                              height: 40,
                                                              child: Consumer<
                                                                      Cart>(
                                                                  builder: ((context,
                                                                      instance,
                                                                      child) {
                                                                return IconButton(
                                                                  color: Colors
                                                                      .grey,
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "item index : $index : $a");
                                                                    int q = 1;

                                                                    for (int i =
                                                                            0;
                                                                        i < instance.selectedproduct.length;
                                                                        i++) {
                                                                      if (instance
                                                                              .selectedproduct[i]
                                                                              .id ==
                                                                          a.referenceArticle) {
                                                                        if (instance.selectedproduct[i].quantite <
                                                                            snapshot.data.docs[i].data()['quantite']) {
                                                                          print(
                                                                              " quantite item : ${snapshot.data.docs[i].data()['quantite']}");
                                                                          print(
                                                                              " quantite selected : ${instance.selectedproduct[i].quantite}");

                                                                          instance
                                                                              .quantite(instance.selectedproduct[i]);

                                                                          1;
                                                                          instance
                                                                              .quantiteTotal();

                                                                          instance.pricee(
                                                                              instance.selectedproduct[i],
                                                                              prix);
                                                                          q++;

                                                                          print(
                                                                              "ind repeat:$index");

                                                                          instance
                                                                              .prices(
                                                                            prix,
                                                                          );
                                                                        } else {
                                                                          final snackBar =
                                                                              SnackBar(
                                                                            content:
                                                                                Text('quantite non disponible'),
                                                                            backgroundColor: Color.fromARGB(
                                                                                255,
                                                                                234,
                                                                                132,
                                                                                124),
                                                                          );

                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(snackBar);
                                                                          q++;
                                                                        }
                                                                      }
                                                                    }
                                                                    print(q);
                                                                    if (q ==
                                                                        1) {
                                                                      print(
                                                                          "index: $index");
                                                                      instance
                                                                          .add(
                                                                              a);

                                                                      instance
                                                                          .quantiteTotal();
                                                                      instance.prices(
                                                                          a.prix);
                                                                    }
                                                                    print(
                                                                        "${instance.selectedproduct}");
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .add_shopping_cart_rounded,
                                                                    size: 27,
                                                                  ),
                                                                );
                                                              })),
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Color.fromARGB(
                                                                            121,
                                                                            168,
                                                                            168,
                                                                            168),
                                                                        blurRadius:
                                                                            15,
                                                                        spreadRadius:
                                                                            -4),
                                                                  ],
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          218,
                                                                          222,
                                                                          241,
                                                                          236)),
                                                            ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        }

                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }),
                                ],
                              )
                              //shrinkWrap: false,

                              ),
                        ],
                      ),
                    )
                  ],
                )
              ]),
            )));
  }
}
