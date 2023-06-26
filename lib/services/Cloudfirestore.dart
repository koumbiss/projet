import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:projet_etudes/model/Collection.dart';
import 'package:projet_etudes/services/DBServices.dart';
import 'package:path/path.dart';
import 'dart:io';

class CloudFirestore {
  addCollection(nom, upl, date) async {
    try {
      // var url = await (await upl).ref.getDownloadURL();
      // print("url:$url");
      await DBServices().saveCollection(
        Collection(
            idCollection: nom, nomCollection: nom, image: upl, date: date),
      );
    } catch (e) {
      print("Exception in methode setlocation : $e");
    }
  }
}
