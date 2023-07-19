import 'package:projet_etudes/model/Utilisateur.dart';

class Fournisseur extends Utilisateur {
  late int idFournisseur;
  late String imageFournisseur, horaires, marque;

  Fournisseur({
    required super.nomUtilisateur,
    required super.email,
    required super.adresse,
    required super.motDePasse,
    required super.age,
    required super.telephone,
    required this.idFournisseur,
    required this.imageFournisseur,
    required this.marque,
    required this.horaires,
  });

  static Fournisseur fromJson(Map<String, dynamic> json) => Fournisseur(
        nomUtilisateur: json['nomUtilisateur'],
        email: json['email'],
        adresse: json['adresse'],
        motDePasse: json['motDePasse'],
        age: json['age'],
        telephone: json['telephone'],
        idFournisseur: json['idFournisseur'],
        imageFournisseur: json['imageFournisseur'],
        marque: json['marque'],
        horaires: json['horaires'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'nomUtilisateur': nomUtilisateur,
        'email': email,
        'adresse': adresse,
        'motDePasse': motDePasse,
        'age': age,
        'telephone': telephone,
        'idFournisseur': idFournisseur,
        'imageFournisseur': imageFournisseur,
        'marque': marque,
        'horaires': horaires,
      };
}
