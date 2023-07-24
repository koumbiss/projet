// ignore: file_names

// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:projet_etudes/services/Cloudfirestore.dart';

class AJoutArticles extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final idcollection;
  const AJoutArticles({super.key, this.idcollection});
  @override
  State<StatefulWidget> createState() {
    return AJoutArticlesstate();
  }
}

class AJoutArticlesstate extends State<AJoutArticles> {
  GlobalKey<FormState> formstates = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var v;
  late int re;
  final nomController = TextEditingController();
  final marqueController = TextEditingController();
  final quatiteController = TextEditingController();
  final prixController = TextEditingController();
  // ignore: non_constant_identifier_names
  final DescriptionController = TextEditingController();
  // ignore: non_constant_identifier_names
  final ReferenceController = TextEditingController();
  // ignore: non_constant_identifier_names
  final CategorieCollection = TextEditingController();

  @override
  void dispose() {
    nomController.dispose();
    marqueController.dispose();
    quatiteController.dispose();
    DescriptionController.dispose();
    prixController.dispose();
    ReferenceController.dispose();
    CategorieCollection.dispose();
    super.dispose();
  }

  // ignore: prefer_typing_uninitialized_variables
  var selected;
  late int prix, quantite;
  File? image;

  var imagepicker = ImagePicker();
  CloudFirestore fire = CloudFirestore();
  // ignore: non_constant_identifier_names
  uploadImage(Sourcee) async {
    try {
      final photo = await imagepicker.pickImage(source: Sourcee);
      if (photo != null) {
        setState(() {
          image = File(photo.path);

          print("image");
          print(image);
        });
        var nameimage = basename(photo.path);
        print("name");
        print(nameimage);
        var refStorage = FirebaseStorage.instance.ref("images/$nameimage");
        UploadTask uploadTask = refStorage.putFile(image!);
        return uploadTask;
      } else {
        print("veuillez choisir une image");
      }
      return null;
    } catch (e) {
      print("erreur :$e");
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var upl;
  //Alert alert = Alert();

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
                          colors: [Colors.white, Colors.white]))),

              // ignore: avoid_unnecessary_containers
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
              // ignore: avoid_unnecessary_containers
              title: Container(
                child: const Text("Ajout d'un produit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white)),
              ),

              elevation: 0,
            ),
            body: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        margin:
                            const EdgeInsets.only(top: 20, left: 10, right: 0),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        child: image == null
                            ? Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/imagevide.jpg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0))),
                                width: 100,
                                height: 500,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25.0),
                                            ),
                                          ),
                                          builder: (ctx) {
                                            return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    height: 4,
                                                    width: 44,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 248, 248, 248),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                  ),
                                                  ListTile(
                                                    leading: const SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                241, 241, 241),
                                                        radius: 50,
                                                        child: Icon(
                                                          Icons.image,
                                                          color: Color.fromARGB(
                                                              255, 72, 72, 72),
                                                          size: 23,
                                                        ),
                                                      ),
                                                    ),
                                                    title: const Text(
                                                      "Selectionner une photo du pelicule",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
                                                              255, 72, 72, 72)),
                                                    ),
                                                    onTap: () {
                                                      upl = uploadImage(
                                                          ImageSource.gallery);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  ListTile(
                                                      leading: const SizedBox(
                                                        width: 40,
                                                        height: 40,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  241,
                                                                  241,
                                                                  241),
                                                          radius: 50,
                                                          child: Icon(
                                                            Icons.camera_alt,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    72,
                                                                    72,
                                                                    72),
                                                            size: 23,
                                                          ),
                                                        ),
                                                      ),
                                                      title: const Text(
                                                          "prendre une photo du camera ",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      72,
                                                                      72,
                                                                      72))),
                                                      onTap: () {
                                                        setState(() {
                                                          upl = uploadImage(
                                                              ImageSource
                                                                  .camera);
                                                        });

                                                        Navigator.of(context)
                                                            .pop();
                                                      })
                                                ]);
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(200, 200),
                                      backgroundColor: const Color.fromARGB(
                                          0, 255, 255, 255),
                                      elevation: 0,
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    child: Container(
                                        color: const Color.fromARGB(
                                            0, 255, 255, 255))))
                            : Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(image!),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30))),
                                width: 200,
                                height: 220,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25.0),
                                            ),
                                          ),
                                          builder: (ctx) {
                                            return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    height: 4,
                                                    width: 44,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 237, 237, 237),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                  ),
                                                  ListTile(
                                                    leading: const SizedBox(
                                                      width: 40,
                                                      height: 40,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                241, 241, 241),
                                                        radius: 50,
                                                        child: Icon(
                                                          Icons.image,
                                                          color: Color.fromARGB(
                                                              255, 72, 72, 72),
                                                          size: 23,
                                                        ),
                                                      ),
                                                    ),
                                                    title: const Text(
                                                      "Selectionner une photo du pelicule",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color.fromARGB(
                                                              255, 72, 72, 72)),
                                                    ),
                                                    onTap: () {
                                                      upl = uploadImage(
                                                          ImageSource.gallery);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  ListTile(
                                                      leading: const SizedBox(
                                                        width: 40,
                                                        height: 40,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  241,
                                                                  241,
                                                                  241),
                                                          radius: 50,
                                                          child: Icon(
                                                            Icons.camera_alt,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    72,
                                                                    72,
                                                                    72),
                                                            size: 23,
                                                          ),
                                                        ),
                                                      ),
                                                      title: const Text(
                                                          "prendre une photo du camera ",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      72,
                                                                      72,
                                                                      72))),
                                                      onTap: () {
                                                        setState(() {
                                                          upl = uploadImage(
                                                              ImageSource
                                                                  .camera);
                                                        });

                                                        Navigator.of(context)
                                                            .pop();
                                                      })
                                                ]);
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      // fixedSize: Size(250, 250),
                                      elevation: 0,
                                      backgroundColor: const Color.fromARGB(
                                          0, 255, 255, 255),
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    child:
                                        Container(color: Colors.transparent))),
                      ),
                      Form(
                          key: formstates,
                          child: Column(
                            children: [
                              Container(
                                  height: 40,
                                  width: 140,
                                  margin: const EdgeInsets.only(
                                      bottom: 10, left: 10, right: 10, top: 20),
                                  child: TextFormField(
                                      controller: CategorieCollection,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "champ vide";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        // errorMaxLines: 5,
                                        hintMaxLines: 19,

                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        //  floatingLabelAlignment: FloatingLabelAlignment.center,
                                        //  floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 116, 203, 232),
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              width: 1),
                                        ),

                                        label: Center(
                                          child: Text(
                                            "Categorie ",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 211, 211, 211)),
                                          ),
                                        ),
                                      ))),
                              Container(
                                  height: 40,
                                  width: 200,
                                  margin: const EdgeInsets.only(
                                      bottom: 10, left: 10, right: 10, top: 20),
                                  child: TextFormField(
                                      controller: ReferenceController,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "champ vide";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        // errorMaxLines: 5,
                                        hintMaxLines: 19,

                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        //  floatingLabelAlignment: FloatingLabelAlignment.center,
                                        //  floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 116, 203, 232),
                                              width: 1),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              width: 1),
                                        ),

                                        label: Center(
                                          child: Text(
                                            "Reference ",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 211, 211, 211)),
                                          ),
                                        ),
                                      ))),
                              Container(
                                  height: 50,
                                  width: 260,
                                  margin: const EdgeInsets.only(
                                      bottom: 10, left: 20, right: 10, top: 20),
                                  child: TextFormField(
                                      controller: nomController,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "champ vide";
                                        } else if (val.length < 2) {
                                          return "entrer un nom valide";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        //  floatingLabelAlignment: FloatingLabelAlignment.center,
                                        //  floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 116, 203, 232),
                                              width: 1),
                                          gapPadding: 0.2,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              width: 1),
                                        ),

                                        label: Center(
                                          child: Text(
                                            "Nom de l'article",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 211, 211, 211)),
                                          ),
                                        ),
                                      ))),
                              Container(
                                  width: 255,
                                  height: 50,
                                  margin: const EdgeInsets.only(
                                      bottom: 10, left: 20, right: 10, top: 20),
                                  child: TextFormField(
                                      controller: prixController,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "champ vide";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (val) {
                                        prix = int.parse(prixController.text);
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        //  floatingLabelAlignment: FloatingLabelAlignment.center,
                                        //  floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 116, 203, 232),
                                              width: 1),
                                          gapPadding: 0.2,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              width: 1),
                                        ),

                                        label: Center(
                                          child: Text(
                                            "Prix",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 211, 211, 211)),
                                          ),
                                        ),
                                      ))),
                              Container(
                                  width: 255,
                                  height: 50,
                                  margin: const EdgeInsets.only(
                                      bottom: 10, left: 20, right: 10, top: 20),
                                  child: TextFormField(
                                      controller: quatiteController,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "champ vide";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (val) {
                                        quantite =
                                            int.parse(quatiteController.text);
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        //  floatingLabelAlignment: FloatingLabelAlignment.center,
                                        //  floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 116, 203, 232),
                                              width: 1),
                                          gapPadding: 0.2,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              width: 1),
                                        ),

                                        label: Center(
                                          child: Text(
                                            "Quantite ",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 211, 211, 211)),
                                          ),
                                        ),
                                      ))),
                              Container(
                                  width: 255,
                                  height: 50,
                                  margin: const EdgeInsets.only(
                                      bottom: 10, left: 20, right: 10, top: 20),
                                  child: TextFormField(
                                      controller: DescriptionController,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "champ vide";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        //  floatingLabelAlignment: FloatingLabelAlignment.center,
                                        //  floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 116, 203, 232),
                                              width: 1),
                                          gapPadding: 0.2,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              width: 1),
                                        ),

                                        label: Center(
                                          child: Text(
                                            "Description ",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 211, 211, 211)),
                                          ),
                                        ),
                                      ))),
                              Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                      Color.fromARGB(255, 42, 41, 41),
                                      Color.fromARGB(255, 34, 32, 32)
                                    ])),
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    var formdata = formstates.currentState;

                                    print(" type ${quatiteController.text}");
                                    print(" qunt $quantite");

                                    if (!formdata!.validate()) {
                                      //  // alert.Showmessage(context, "Champs vide");
                                    } else if (upl != null) {
                                      print(
                                          "ref ${ReferenceController.text} url $upl");
                                      print(
                                          "nom ${nomController.text} prix $upl");

                                      CloudFirestore().addArticle(
                                          ReferenceController.text,
                                          nomController.text,
                                          prix,
                                          quantite,
                                          DescriptionController.text,
                                          upl,
                                          widget.idcollection,
                                          CategorieCollection.text);
                                      print("C'est bon ");
                                      Navigator.pop(context);
                                      // var ider = FirebaseAuth
                                      //     .instance.currentUser!.uid;
                                      // Navigator.pop(context);
                                    }
                                    //  else
                                    //   alert.Showmessage(context,
                                    //       "Vous devez choisir une photo");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        const Color.fromARGB(0, 244, 67, 54),
                                    padding: const EdgeInsets.all(10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  child: const Text("Ajouter",
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            )));
  }
}
