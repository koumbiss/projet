import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_etudes/Provider/Cart.dart';
import 'package:projet_etudes/services/Cloudfirestore.dart';

import 'package:provider/provider.dart';

class Panier extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pannier(),
      // routes: {"1": ((context) => Pharma())},
    );
  }
}

class Pannier extends StatefulWidget {
  State<StatefulWidget> createState() {
    return PannierState();
  }
}

class PannierState extends State<Pannier> {
  int indexx = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(children: [
            Consumer<Cart>(builder: ((context, value, child) {
              return Stack(children: [
                Container(
                  margin: EdgeInsets.only(right: 25),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag_rounded,
                          color: const Color.fromARGB(255, 0, 0, 0))),
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
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(98, 255, 255, 255)),
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
          width: 40,
          margin: EdgeInsets.only(left: 29, top: 5, bottom: 5),
          height: 30,
        ),
        toolbarHeight: 53,
        // leading: Text("PG"),
        centerTitle: true,

        //shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(topLeft: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(14),topRight: Radius.circular(0))),
        title: Container(
            child: Text(
          "Panier",
          style: GoogleFonts.quicksand(
            color: const Color.fromARGB(255, 10, 10, 10),
            fontSize: 26,
          ),
        )),

        elevation: 0,
      ),
      body: Builder(builder: (context) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
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
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: value.selectedproduct.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 1,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              onDismissed: (direction) {
                                value.delete(value.selectedproduct[index]);
                              },
                              key: UniqueKey(),
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                  left: 0,
                                  right: 20,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                height: 300,
                                child: Row(children: [
                                  Expanded(
                                    child: Container(
                                      height: 300,
                                      margin: EdgeInsets.only(top: 0),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  121, 168, 168, 168),
                                              blurRadius: 15,
                                              spreadRadius: -7),
                                        ],
                                      ),
                                      child: SizedBox(
                                        height: double.infinity,
                                        child: Image.network(
                                          "${value.selectedproduct[index].image}",
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 12, right: 20),
                                        width: 200,
                                        child: Text(
                                          value.selectedproduct[index]
                                              .nomArticle,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.quicksand(
                                              // fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 18),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 170,
                                            margin: EdgeInsets.only(
                                                top: 5, left: 0),
                                            child: Text(
                                              value.selectedproduct[index]
                                                  .description,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.quicksand(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 20),
                                        child: Container(
                                          child: Row(children: [
                                            Container(
                                              height: 38,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                // gradient: LinearGradient(
                                                //     begin: Alignment.topLeft,
                                                //     end: Alignment.bottomRight,
                                                //     colors: [
                                                //       Color.fromARGB(255, 222, 244, 243),
                                                //       Color.fromARGB(255, 114, 171, 157),
                                                //     ]),
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: 0, left: 10),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        var qte = await CloudFirestore()
                                                            .checkquantity(
                                                                value
                                                                    .selectedproduct[
                                                                        index]
                                                                    .referenceArticle,
                                                                value
                                                                    .selectedproduct[
                                                                        index]
                                                                    .categorie);

                                                        print(
                                                            " quantite DB $qte");
                                                        print(
                                                            " quantite DB ${value.selectedproduct[index].quantite}");
                                                        if (qte >
                                                            value
                                                                .selectedproduct[
                                                                    index]
                                                                .quantite) {
                                                          print("Hi");
                                                          value.quantite(value
                                                                  .selectedproduct[
                                                              index]);
                                                          value.pricee(
                                                              value.selectedproduct[
                                                                  index],
                                                              value
                                                                  .selectedproduct[
                                                                      index]
                                                                  .prixunitaire);
                                                          value.prices(
                                                            value
                                                                .selectedproduct[
                                                                    index]
                                                                .prixunitaire,
                                                          );
                                                          print(
                                                              " prix unitaire ${value.selectedproduct[index].prixunitaire}");
                                                        } else {
                                                          print("Hi");

                                                          final snackBar =
                                                              SnackBar(
                                                            content: Text(
                                                                'quantite non disponible'),
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    234,
                                                                    132,
                                                                    124),
                                                          );

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  snackBar);
                                                        }
                                                      },
                                                      icon: Icon(
                                                          Icons.add_rounded,
                                                          color: const Color
                                                              .fromARGB(255, 37,
                                                              37, 37))),
                                                  Text(
                                                      " ${value.selectedproduct[index].quantite}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  IconButton(
                                                      onPressed: () {
                                                        value.diminuequantite(
                                                            value.selectedproduct[
                                                                index],
                                                            value
                                                                .selectedproduct[
                                                                    index]
                                                                .prixunitaire);
                                                        if (value
                                                                .selectedproduct[
                                                                    index]
                                                                .quantite ==
                                                            0) {
                                                          value.delete(value
                                                                  .selectedproduct[
                                                              index]);
                                                        }
                                                      },
                                                      icon: Icon(
                                                          Icons.remove_outlined,
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 0, 0, 0))),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 15, right: 20),
                                          height: 26,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                              " ${value.selectedproduct[index].prix} Mro",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.quicksand(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 17,
                                              )))
                                    ],
                                  ))
                                ]),
                              ),
                            );
                          },
                        );
                      }
                    })),
                  ],
                ),
              ),
              Expanded(
                  flex: 0,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(0),
                    height: 70,
                    child: Consumer<Cart>(builder: ((context, value, child) {
                      return Row(
                        children: [
                          Container(
                              width: 170,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              margin: EdgeInsets.only(right: 20, left: 25),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(90, 30),
                                    elevation: 0,
                                    primary: Color.fromARGB(0, 252, 252, 252),
                                  ),
                                  onPressed: value.selectedproduct.length == 0
                                      ? null
                                      : () {
                                          if (FirebaseAuth
                                                  .instance.currentUser !=
                                              null) {
                                            List Listid = [];
                                            for (int i = 0;
                                                i <
                                                    value
                                                        .selectedproduct.length;
                                                i++) {
                                              print(
                                                  "list: ${value.selectedproduct[i].pharmacieref}");
                                              Listid.add(value
                                                  .selectedproduct[i]
                                                  .pharmacieref);
                                            }
                                            print("list: $Listid");
                                            var seen = Set<String>();
                                            List uniquelist = Listid.where(
                                                (id) => seen.add(id)).toList();
                                            print(" unique List $uniquelist");

                                            // Navigator.of(context,
                                            //         rootNavigator: true)
                                            //     .push(MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             new Confirmationpage(
                                            //                 listid:
                                            //                     uniquelist)));
                                          } else {
                                            // Navigator.of(context,
                                            //         rootNavigator: true)
                                            //     .push(MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             new Logiin()));
                                          }
                                        },
                                  child: Text(
                                    FirebaseAuth.instance.currentUser == null
                                        ? "SE CONNECTER"
                                        : "CONTINUER",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 16, color: Colors.white),
                                  ))),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 0, top: 5),
                                  child: Text("total ",
                                      style: GoogleFonts.quicksand(
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                          color: Color.fromARGB(
                                              255, 196, 196, 196)))),
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                child: Text("${value.price} Mro",
                                    style: GoogleFonts.quicksand(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 2, 2, 2))),
                              )
                            ],
                          ),
                        ],
                      );
                    })),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
