import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_etudes/Fournisseur/AjoutArticles.dart';
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:projet_etudes/client/ArticleDetails.dart';
import 'package:projet_etudes/client/Menu.dart';

import 'package:projet_etudes/model/Article.dart';
import 'package:projet_etudes/model/Item.dart';
import 'package:provider/provider.dart';

class ArticlesFR extends StatefulWidget {
  final idc, nomcollection;
  ArticlesFR({
    Key? key,
    this.idc,
    this.nomcollection,
  }) : super(key: key);

  State<StatefulWidget> createState() {
    return ArticlesFRState();
  }
}

class ArticlesFRState extends State<ArticlesFR> {
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
                  color: const Color.fromARGB(255, 58, 58, 58),
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
                    Container(
                      width: 400,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AJoutArticles(
                                        idcollection: widget.idc,
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(20, 20),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          elevation: 0,
                          padding: const EdgeInsets.all(0),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 31, 30, 30),
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 10, top: 200, bottom: 40),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        // borderRadius: BorderRadius.circular(70),
                      ),

                      height: 610,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                          ),
                          Container(
                              width: 330,
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 10, right: 20),
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
                                            return const Center(
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
                                                var image;
                                                var nom;

                                                var category;
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

                                                print("lenght marge $mmargin");

                                                return Container(
                                                  // height: 200,

                                                  margin: const EdgeInsets.only(
                                                      left: 0,
                                                      top: 10,
                                                      right: 0,
                                                      bottom: 5),

                                                  padding:
                                                      const EdgeInsets.all(0),

                                                  decoration:
                                                      const BoxDecoration(
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
                                                            // print(nom);

                                                            // print(prix);
                                                            // print(description);
                                                            // print(
                                                            //     "id collection :");
                                                            // print(widget.idc);

                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //         builder: (context) => ArticleDetails(
                                                            //             item: a,
                                                            //             quantite: mesproduits[index]
                                                            //                 .quantite,
                                                            //             Reference:
                                                            //                 mesproduits[index]
                                                            //                     .referenceArticle,
                                                            //             image:
                                                            //                 image,
                                                            //             nom: mesproduits[index]
                                                            //                 .nomArticle,
                                                            //             prix:
                                                            //                 prix,
                                                            //             description:
                                                            //                 description)));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            fixedSize:
                                                                const Size(
                                                                    110, 160),
                                                            backgroundColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            elevation: 0,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              // ignore: unnecessary_null_comparison
                                                              image == null
                                                                  ? SizedBox(
                                                                      child: Image
                                                                          .network(
                                                                        "lib/images/imagevide.jpg",
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      height:
                                                                          300,
                                                                      width:
                                                                          200,
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              0),
                                                                      decoration:
                                                                          const BoxDecoration(
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
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            top:
                                                                                5,
                                                                            bottom:
                                                                                5,
                                                                            right:
                                                                                10),
                                                                        color: const Color
                                                                            .fromARGB(
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
                                                          )),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(top: 0),
                                                          child: Text(
                                                              nom ==
                                                                      null
                                                                  ? ""
                                                                  : nom,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .quicksand(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          81,
                                                                          79,
                                                                          79),
                                                                      fontSize:
                                                                          17))),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 0),
                                                        width: 120,
                                                        child: Text(
                                                            // ignore: unnecessary_null_comparison
                                                            prix == null
                                                                ? ""
                                                                : "$prix Mro",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .quicksand(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255, 0, 0, 0),
                                                              fontSize: 15,
                                                            )),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 2),
                                                        width: 130,
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 0, 0, 0),
                                                          width: 1,
                                                        )),
                                                        child: Consumer<Cart>(
                                                            builder: ((context,
                                                                instance,
                                                                child) {
                                                          return ElevatedButton(
                                                              onPressed: () {},
                                                              style: ElevatedButton.styleFrom(
                                                                  elevation: 0,
                                                                  backgroundColor:
                                                                      const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          0)),
                                                              child: Text(
                                                                "${snapshot.data.docs[index].data()['referenceArticle']}",
                                                                style: GoogleFonts
                                                                    .quicksand(
                                                                        fontSize:
                                                                            12,
                                                                        color: const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            3,
                                                                            3,
                                                                            3)),
                                                              ));
                                                        })),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        }

                                        return const Center(
                                          child:
                                              const CircularProgressIndicator(),
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
