// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
=======
import 'package:flutter/foundation.dart';
//import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:projet_etudes/client/ArticleDetails.dart';
import 'package:projet_etudes/client/Menu.dart';
import 'package:projet_etudes/client/Panier.dart';

<<<<<<< HEAD
=======
//import 'dart:math' as math;
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337

import 'package:projet_etudes/model/Article.dart';
import 'package:provider/provider.dart';

import '../model/Item.dart';

class Articles extends StatefulWidget {
<<<<<<< HEAD
  final id, idc, nom, photo, categorie;
  const Articles({super.key, this.idc, this.id, this.categorie, this.nom, this.photo});
  @override
=======
  final idc, nomcollection;
  Articles({
    Key? key,
    this.idc,
    this.nomcollection,
  }) : super(key: key);
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
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
  @override
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
                        margin: const EdgeInsets.only(right: 25),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menu(indexx: 1)));
                            },
                            icon: Icon(Icons.shopping_bag_rounded,
                                color: const Color.fromARGB(255, 37, 37, 37))),
                      ),
                      Positioned(
                          top: 2,
                          left: 30,
                          child: Container(
                            height: 20,
                            width: 30,
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(99, 224, 224, 224)),
                            child: Text(
                              " ${value.qte}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: const Color.fromARGB(255, 3, 3, 3)),
                            ),
<<<<<<< HEAD
=======
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(96, 255, 255, 255)),
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
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
                widget.nomcollection,
                style: GoogleFonts.quicksand(
                  color: Color.fromARGB(255, 58, 58, 58),
                  fontSize: 27,
                ),
              )),

              elevation: 0,
            ),
            resizeToAvoidBottomInset: true,
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [Colors.white, Colors.white])),
              child: ListView(children: [
                Column(
                  children: [
<<<<<<< HEAD
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
                                  categorie:
                                      snapshot.data.docs[i].data()['categorie'],
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
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                    Row(
                      children: [
                        Container(
                            width: 300,
                            margin:
                                const EdgeInsets.only(top: 10, bottom: 20, left: 30),
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print("search : $value");
                                print("search : ${searchControl.text}");
                              },
                              controller: searchControl,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
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
                                  contentPadding: EdgeInsets.all(15.5)),
                            )),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          decoration: const BoxDecoration(
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
                              } else {
                                setState(() {
                                  boolean = true;
                                });
                              }
                            },
                            icon: const Icon(Icons.search),
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
=======
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                    Container(
                      // margin: EdgeInsets.only(left: 10, top: 200, bottom: 40),
                      decoration: BoxDecoration(
                        color: couleur,
                        // borderRadius: BorderRadius.circular(70),
                      ),

                      height: 610,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                          ),
                          Container(
                              width: 400,
<<<<<<< HEAD
                              padding: const EdgeInsets.only(left: 10, right: 20),
=======
                              padding: EdgeInsets.only(
                                  left: 10, bottom: 10, right: 20),
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                              child: ListView(
                                children: [
                                  StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection("Articles")
                                          .where("collection",
                                              isEqualTo: widget.idc)
                                          .snapshots(),
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data.docs.length == 0) {
                                            return Center(
                                                child: Text(
                                                    "Il n'ya pas encore d'articles"));
                                          }

                                          mesproduits.clear();

                                          for (int i = 0;
                                              i < snapshot.data.docs.length;
                                              i++) {
                                            mesproduits.add(Article(
                                                referenceArticle:
                                                    snapshot.data.docs[i].id,
                                                collection: snapshot.data.docs[i]
                                                    .data()['collection'],
                                                description: snapshot.data.docs[i]
                                                    .data()['description'],
                                                image: snapshot.data.docs[i]
                                                    .data()['image'],
                                                nomArticle: snapshot.data.docs[i]
                                                    .data()['nomArticle'],
                                                disponibilite: snapshot.data.docs[i]
                                                    .data()['disponibilite'],
                                                prix: snapshot.data.docs[i]
                                                    .data()['prix'],
                                                quantite: snapshot.data.docs[i]
                                                    .data()['quantite'],
                                                categorie: snapshot.data.docs[i]
                                                    .data()['categorie']));
                                          }
                                          // mesproduits.addAll(mesproduits2);

                                          return GridView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
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
<<<<<<< HEAD
                                                String image;
                                                String nom;
                                                
                                                var contenuN;
                                                String marque;
                                                // ignore: unused_local_variable
                                                int quantite;
                                                int prix;
                                                String description;
                                                String collection;
                                                String disponibilte;
=======
                                                var image;
                                                var nom;

                                                var category;
                                                var quantite;
                                                var prix;
                                                var description;
                                                var collection;
                                                var disponibilte;
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337

                                                image =
                                                    mesproduits[index].image;
                                                collection = mesproduits[index]
                                                    .collection;
                                                nom = mesproduits[index]
                                                    .nomArticle;

                                                collection = mesproduits[index]
                                                    .collection;
                                                quantite =
                                                    mesproduits[index].quantite;
                                                prix = mesproduits[index].prix;
                                                description = mesproduits[index]
                                                    .description;
                                                category = mesproduits[index]
                                                    .categorie;

                                                disponibilte =
                                                    mesproduits[index]
                                                        .disponibilite;

                                                Item a = Item(
                                                  categorie: category,
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
                                                    "lenght marge $mmargin");

                                                return Container(
                                                  // height: 200,

<<<<<<< HEAD
                                                  margin: const EdgeInsets.only(
                                                      left: 10,
=======
                                                  margin: EdgeInsets.only(
                                                      left: 0,
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                                                      top: 10,
                                                      right: 0,
                                                      bottom: 5),

<<<<<<< HEAD
                                                  padding: const EdgeInsets.all(10),
=======
                                                  padding: EdgeInsets.all(0),
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337

                                                  decoration: const BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Color.fromARGB(
                                                              121,
                                                              255,
                                                              255,
                                                              255),
                                                          blurRadius: 15,
                                                          spreadRadius: -7),
                                                    ],
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                  ),

                                                  child: Column(
                                                    children: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            print(nom);

                                                            print(prix);
                                                            print(description);
                                                            print(
                                                                "id collection :");
                                                            print(widget.idc);

                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => ArticleDetails(
                                                                        item: a,
                                                                        quantite: mesproduits[index]
                                                                            .quantite,
                                                                        Reference:
                                                                            mesproduits[index]
                                                                                .referenceArticle,
                                                                        image:
                                                                            image,
                                                                        nom: mesproduits[index]
                                                                            .nomArticle,
                                                                        prix:
                                                                            prix,
                                                                        description:
                                                                            description)));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize:
                                                                const Size(120, 120), backgroundColor: const Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            elevation: 1,
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    0),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            90)),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              // ignore: unnecessary_null_comparison
                                                              image == null
<<<<<<< HEAD
                                                                  ? const CircleAvatar(
                                                                      backgroundColor: Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                      backgroundImage:
                                                                          AssetImage(
=======
                                                                  ? SizedBox(
                                                                      child: Image
                                                                          .network(
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                                                                        "lib/images/imagevide.jpg",
                                                                      ),
                                                                    )
<<<<<<< HEAD
                                                                  : CircleAvatar(
                                                                      backgroundColor: const Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                      backgroundImage:
                                                                          NetworkImage(
                                                                        image,
=======
                                                                  : Container(
                                                                      height:
                                                                          300,
                                                                      width:
                                                                          200,
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                              top: 0),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: Color.fromARGB(121, 180, 35, 35),
                                                                              blurRadius: 15,
                                                                              spreadRadius: -7),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            300,
                                                                        height:
                                                                            double.infinity,
                                                                        child: Image
                                                                            .network(
                                                                          image,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          height:
                                                                              200,
                                                                        ),
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                                                                      ),
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
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                10,
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                5,
                                                                            right:
                                                                                10),
                                                                        color: const Color.fromARGB(
                                                                            136,
                                                                            193,
                                                                            193,
                                                                            193),
                                                                        child:
                                                                            const Text(
                                                                          " non disponible ",
                                                                          style:
                                                                              TextStyle(color: Color.fromARGB(255, 140, 7, 7)),
                                                                        ),
                                                                      ))
                                                                  : Container()
                                                            ],
<<<<<<< HEAD
                                                          )),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                              nom,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      17))),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                              marque,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      14))),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets.only(
                                                                  top: 5),
                                                          child: Text(
                                                              // ignore: unnecessary_null_comparison
                                                              contenuN == null
                                                                  ? ""
                                                                  : "$contenuN",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      13))),
                                                      Container(
                                                        margin: const EdgeInsets.only(
                                                            top: 5),
                                                        decoration: BoxDecoration(
                                                            boxShadow: const [
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
                                                                const Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 2,
                                                                bottom: 2,
                                                                left: 2,
                                                                right: 2),
                                                        width: 240,
=======
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize:
                                                                Size(170, 220),
                                                            elevation: 0,
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
                                                          )),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 0),
                                                          child: Text(
                                                              nom == null
                                                                  ? ""
                                                                  : nom,
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts.quicksand(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          81,
                                                                          79,
                                                                          79),
                                                                  fontSize:
                                                                      17))),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0),
                                                        width: 120,
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                                                        child: Text(
                                                            // ignore: unnecessary_null_comparison
                                                            prix == null
                                                                ? ""
                                                                : "$prix Mro",
                                                            textAlign: TextAlign
                                                                .center,
<<<<<<< HEAD
                                                            style: const TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
=======
                                                            style: GoogleFonts
                                                                .quicksand(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      0, 0, 0),
                                                              fontSize: 15,
                                                            )),
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                                                      ),
                                                      snapshot.data.docs[index]
                                                                      .data()[
                                                                  'quantite'] ==
                                                              0
                                                          ? Container()
                                                          : Container(
<<<<<<< HEAD
                                                              margin: const EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              width: 40,
                                                              height: 40,
                                                              decoration: const BoxDecoration(
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
=======
                                                              margin: EdgeInsets
                                                                  .only(top: 2),
                                                              width: 150,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                width: 1,
                                                              )),
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                                                              child: Consumer<
                                                                      Cart>(
                                                                  builder: ((context,
                                                                      instance,
                                                                      child) {
                                                                return ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          "click");
                                                                      print(
                                                                          "item index : $index : $a");
                                                                      int q = 1;

                                                                      for (int i =
                                                                              0;
                                                                          i < instance.selectedproduct.length;
                                                                          i++) {
                                                                        if (instance.selectedproduct[i].referenceArticle ==
                                                                            a.referenceArticle) {
                                                                          if (instance.selectedproduct[i].quantite <
                                                                              snapshot.data.docs[i].data()['quantite']) {
                                                                            print(" quantite item : ${snapshot.data.docs[i].data()['quantite']}");
                                                                            print(" quantite selected : ${instance.selectedproduct[i].quantite}");

                                                                            instance.quantite(instance.selectedproduct[i]);

                                                                            1;
                                                                            instance.quantiteTotal();

                                                                            instance.pricee(instance.selectedproduct[i],
                                                                                prix);
                                                                            q++;

                                                                            print("ind repeat:$index");

<<<<<<< HEAD
                                                                          instance
                                                                              .prices(
                                                                            prix,
                                                                          );
                                                                        } else {
                                                                          const snackBar =
                                                                              SnackBar(
                                                                            content:
                                                                                Text('quantite non disponible'),
                                                                            backgroundColor: Color.fromARGB(
                                                                                255,
                                                                                234,
                                                                                132,
                                                                                124),
                                                                          );
=======
                                                                            instance.prices(
                                                                              prix,
                                                                            );
                                                                          } else {
                                                                            final snackBar =
                                                                                SnackBar(
                                                                              content: Text('quantite non disponible'),
                                                                              backgroundColor: Color.fromARGB(255, 234, 132, 124),
                                                                            );
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337

                                                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                                                                            .add(a);

<<<<<<< HEAD
                                                                      instance
                                                                          .quantiteTotal();
                                                                      instance.prices(
                                                                          a.prix);
                                                                    }
                                                                    
                                                                    print(
                                                                        "${instance.selectedproduct}");
                                                                  },
                                                                  icon: const Icon(
                                                                    Icons
                                                                        .add_shopping_cart_rounded,
                                                                    size: 27,
                                                                  ),
                                                                );
=======
                                                                        instance
                                                                            .quantiteTotal();
                                                                        instance
                                                                            .prices(a.prix);
                                                                      }
                                                                      print(
                                                                          "${instance.selectedproduct}");
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        elevation:
                                                                            0,
                                                                        primary: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255),
                                                                        padding:
                                                                            EdgeInsets.all(0)),
                                                                    child: Text(
                                                                      "AJOUTER AU PANIER",
                                                                      style: GoogleFonts.quicksand(
                                                                          fontSize:
                                                                              14,
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              3,
                                                                              3,
                                                                              3)),
                                                                    ));
>>>>>>> a1755a4d798e7b014df32f81d494e34648f12337
                                                              })),
                                                            ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        }

                                        return const Center(
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
