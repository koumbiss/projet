class Article {
  late String referenceArticle,
      nomArticle,
      disponibilite,
      description,
      image,
      collection,
      categorie;

  late int quantite, prix;
  Article(
      {required this.referenceArticle,
      required this.nomArticle,
      required this.disponibilite,
      required this.description,
      required this.image,
      required this.quantite,
      required this.prix,
      required this.collection,
      required this.categorie});

//doc.data())).toList()
  static Article fromJson(Map<String, dynamic> json) => Article(
        referenceArticle: json['referenceArticle'],
        nomArticle: json['nomArticle'],
        quantite: json['quantite'],
        disponibilite: json['disponibilite'],
        prix: json['prix'],
        description: json['description'],
        image: json['image'],
        collection: json['collection'],
        categorie: json['categorie'],
      );

  Map<String, dynamic> toJson() => {
        'referenceArticle': referenceArticle,
        'nomArticle': nomArticle,
        'disponibilite': disponibilite,
        'quantite': quantite,
        'prix': prix,
        'description': description,
        'image': image,
        'collection': collection,
        'categorie': categorie,
      };
}
