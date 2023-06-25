import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Item.dart';

class Cart with ChangeNotifier {
  List selectedproduct = [];
  int price = 0;
  num qte = 0;
  double puni = 0;

  add(Item productt) async {
    selectedproduct.add(productt);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    notifyListeners();
  }

  prices(int e) {
    price = price + e;
    notifyListeners();
  }

  delete(Item productt) {
    selectedproduct.remove(productt);

    price = price - productt.prix.round();
    qte = qte - productt.quantite;

    notifyListeners();
  }

  deletespecifItem(id, Item productt) {
    selectedproduct.removeWhere((productt) => productt.id == id);
    price = price - productt.prix.round();
    qte = qte - productt.quantite;
    notifyListeners();
  }

  // addquantite(Item productt) {
  //   productt.quantite = productt.quantite + 1;
  //   qte = qte + productt.quantite;

  //   notifyListeners();
  // }

  diminuequantite(Item pro, int p) {
    pro.quantite = pro.quantite - 1;
    qte = qte - 1;
    pro.prix = pro.prix - p;
    price = price - p;
    notifyListeners();
  }

  quantiteTotal() {
    qte = 0;
    for (int i = 0; i < selectedproduct.length; i++) {
      qte = qte + selectedproduct[i].quantite;
      print("quantite : $qte");

      notifyListeners();
    }
  }

  quantite(Item pro) {
    pro.quantite = pro.quantite + 1;
    qte = qte + 1;
    notifyListeners();
  }

  pricee(Item pro, int p) {
    pro.prix = pro.prix + p;
  }
}
