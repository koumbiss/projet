class Item {
  late String referenceArticle,
      nomArticle,
      prixunitaire,
      disponibilite,
      description,
      image,
      collection;
  late int prix, quantite;
  Item(
      {required this.referenceArticle,
      required this.prixunitaire,
      required this.nomArticle,
      required this.disponibilite,
      required this.description,
      required this.image,
      required this.quantite,
      required this.prix,
      required this.collection});

//doc.data())).toList()
  static Item fromJson(Map<String, dynamic> json) => Item(
        referenceArticle: json['referenceArticle'],
        prixunitaire: json["prixunitaire"],
        nomArticle: json['nomArticle'],
        quantite: json['quantite'],
        disponibilite: json['disponibilite'],
        prix: json['prix'],
        description: json['description'],
        image: json['image'],
        collection: json['collection'],
      );

  Map<String, dynamic> toJson() => {
        'referenceArticle': referenceArticle,
        'prixunitaire': prixunitaire,
        'nomArticle': nomArticle,
        'disponibilite': disponibilite,
        'quantite': quantite,
        'prix': prix,
        'description': description,
        'image': image,
        'collection': collection,
      };
}
