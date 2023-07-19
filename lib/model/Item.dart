class Item {
  late String referenceArticle,
      nomArticle,
      disponibilite,
      description,
      image,
      collection,
      categorie;
  late int prix, quantite, prixunitaire;
  Item(
      {required this.referenceArticle,
      required this.prixunitaire,
      required this.nomArticle,
      required this.disponibilite,
      required this.description,
      required this.image,
      required this.quantite,
      required this.prix,
      required this.categorie,
      required this.collection});

//doc.data())).toList()
  static Item fromJson(Map<String, dynamic> json) => Item(
        referenceArticle: json['referenceArticle'],
        prixunitaire: json["prixunitaire"],
        nomArticle: json['nomArticle'],
        categorie: json['categorie'],
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
        'categorie': categorie,
        'description': description,
        'image': image,
        'collection': collection,
      };
}
