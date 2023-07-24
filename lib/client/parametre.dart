import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:provider/provider.dart';

class ModificationScreen extends StatefulWidget {
  final champ, value;
  ModificationScreen({
    this.champ,
    this.value,
    Key? key,
  }) : super(key: key);

  State<StatefulWidget> createState() {
    return ModificationScreenState();
  }
}

class ModificationScreenState extends State<ModificationScreen> {
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
                        colors: [
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 0, 0, 0)
                ]))),

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
              widget.champ,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "",
                  fontWeight: FontWeight.bold),
            )),

            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                )),
                margin: EdgeInsets.only(top: 15, left: 40),
                child: Text(widget.value, style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ));
  }
}
