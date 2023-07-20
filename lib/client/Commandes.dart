import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:provider/provider.dart';

class Commandes extends StatefulWidget {
  final listproduits, id, total;
  const Commandes({super.key, this.id, this.listproduits, this.total});
  @override
  State<StatefulWidget> createState() {
    return CommandesState();
  }
}

class CommandesState extends State<Commandes> {
  int indexx = 0;
  var totale;
  bool livraison = false;
  var btmColors2 = Colors.white;
  // var btmColors22 = Colors.black;
  var textColor2 = const Color.fromARGB(255, 0, 0, 0);
  var textColor1 = const Color.fromARGB(255, 0, 0, 0);
  var btmColors1 = const Color.fromARGB(255, 251, 251, 251);
  //var btmColors11 = Color.fromARGB(255, 251, 251, 251);
  List<String> listype = [];
  bool b1 = false;
  bool b2 = true;
  CollectionReference ref = FirebaseFirestore.instance.collection("Pharmacies");
  @override
  void initState() {
    print(" mes donnees : ${widget.total}");
    print(" mes donnees : ${widget.id}");
    print(" mes donnees : ${widget.listproduits}");

    totale = widget.total;
    super.initState();
  }

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
                        colors: [Colors.white, Colors.white]))),

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
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Consumer<Cart>(builder: ((context, value, child) {
                        if (value.selectedproduct.isEmpty) {
                          return Container(
                            child: const Center(
                                child: Text("aucun produit dans votre panier")),
                          );
                        } else {
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.listproduits.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 5,
                              mainAxisSpacing: 1,
                            ),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.only(
                                    top: 5, left: 3, right: 3),
                                color: const Color.fromARGB(9, 76, 49, 49),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      width: 50,
                                      child: Text(
                                          " ${widget.listproduits[index].quantite} ",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontSize: 20,
                                              color: const Color.fromARGB(
                                                  255, 0, 0, 0))),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 3),
                                          width: 280,
                                          child: Text(
                                              "  ${widget.listproduits[index].nomArticle}",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 20,
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ),
                                        Container(
                                          width: 100,
                                          margin: const EdgeInsets.only(top: 6),
                                          padding:
                                              const EdgeInsets.only(left: 3),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            width: 1,
                                          )),
                                          child: Text(
                                              "${widget.listproduits[index].prix} Mro",
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 20,
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      })),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 40, top: 10, right: 40, bottom: 10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: textColor1,
                                        width: 1,
                                      ),
                                      color: btmColors1,
                                    ),
                                    margin: const EdgeInsets.only(
                                        top: 6, bottom: 3, left: 0, right: 0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(140, 100),
                                          backgroundColor: const Color.fromARGB(
                                              0, 255, 255, 255),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10))),
                                          elevation: 0),
                                      onPressed: () {
                                        setState(() {
                                          textColor1 = const Color.fromARGB(
                                              255, 255, 255, 255);
                                          btmColors1 = const Color.fromARGB(
                                              255, 0, 0, 0);

                                          btmColors2 = const Color.fromARGB(
                                              255, 251, 251, 251);

                                          textColor2 = const Color.fromARGB(
                                              255, 0, 0, 0);
                                          b1 = true;
                                          b2 = false;
                                          setState(() {
                                            livraison = true;
                                            totale = 70 + widget.total;
                                          });
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Livraison",
                                            style: GoogleFonts.quicksand(
                                              fontSize: 18,
                                              color: textColor1,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 50,
                                    margin: const EdgeInsets.only(
                                        top: 6, bottom: 3, left: 20, right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: textColor2,
                                        width: 1,
                                      ),
                                      color: btmColors2,
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(140, 100),
                                          backgroundColor: const Color.fromARGB(
                                              0, 255, 255, 255),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10))),
                                          elevation: 0),
                                      onPressed: () {
                                        setState(() {
                                          btmColors2 = const Color.fromARGB(
                                              255, 0, 0, 0);

                                          textColor2 = Colors.white;

                                          btmColors1 = const Color.fromARGB(
                                              255, 251, 251, 251);
                                          textColor1 = const Color.fromARGB(
                                              255, 0, 0, 0);
                                          b2 = true;
                                          b1 = false;
                                          setState(() {
                                            totale = widget.total;
                                            livraison = false;
                                          });
                                        });
                                      },
                                      child: Text(
                                        "Retrait a la boutique",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 18,
                                          color: textColor2,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Produits ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 74, 74, 74),
                                      ),
                                    ),
                                    Text(
                                      "${widget.total} Mro ",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 74, 74, 74),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: btmColors1 ==
                                          const Color.fromARGB(255, 0, 0, 0)
                                      ? const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Livraison ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 74, 74, 74),
                                              ),
                                            ),
                                            Text(
                                              " 70 Mro",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 74, 74, 74),
                                              ),
                                            )
                                          ],
                                        )
                                      : const SizedBox(
                                          height: 3,
                                          width: 3,
                                        )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "TOTAL ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    " $totale Mro ",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 20,
                                      color: const Color.fromARGB(255, 0, 0, 0),
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
                      padding: const EdgeInsets.all(0),
                      height: 70,
                      width: 340,
                      child: Consumer<Cart>(builder: ((context, value, child) {
                        return Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 7,
                                    spreadRadius: -3,
                                    color: Color.fromARGB(255, 210, 208, 208))
                              ],
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, top: 12, bottom: 12),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
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
