// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class ProduitPanier {
    int idArticle;
    String libelle;
    double? montant;
    double quantite;
    double quantiteStock;
    double prix;
    String? photo;

  ProduitPanier({
    required this.idArticle,
    required this.libelle,
    this.montant,
    required this.quantite,
    required this.quantiteStock,
    required this.prix,
    this.photo,
  });
  

  ProduitPanier copyWith({
    int? idArticle,
    String? libelle,
    double? montant,
    double? quantite,
    double? quantiteStock,
    double? prix,
    String? photo,
  }) {
    return ProduitPanier(
      idArticle: idArticle ?? this.idArticle,
      libelle: libelle ?? this.libelle,
      montant: montant ?? this.montant,
      quantite: quantite ?? this.quantite,
      quantiteStock: quantiteStock ?? this.quantiteStock,
      prix: prix ?? this.prix,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idArticle': idArticle,
      'libelle': libelle,
      'montant': montant,
      'quantite': quantite,
      'quantiteStock': quantiteStock,
      'prix': prix,
      'photo': photo,
    };
  }
  factory ProduitPanier.fromProduitCatalogue(ProduitCatalogue produitCatalogue) {
    return ProduitPanier(
      idArticle: produitCatalogue.id ,
      libelle: produitCatalogue.libelle,
     // montant: produitCatalogue.nouveauPrix*produitCatalogue.qteComd!.toDouble(),
       quantite: 1,
      quantiteStock: produitCatalogue.qteStock.toDouble(),
      prix: produitCatalogue.nouveauPrix,
      photo: produitCatalogue.photo,
    );
  }
  factory ProduitPanier.fromMap(Map<String, dynamic> map) {
    return ProduitPanier(
      idArticle: map['idArticle'] as int,
      libelle: map['libelle'] as String,
      montant: map['montant'] != null ? map['montant'] as double : null,
      quantite: map['quantite'] as double,
      quantiteStock: map['quantiteStock'] as double,
      prix: map['prix'] as double,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProduitPanier.fromJson(String source) => ProduitPanier.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProduitPanier(idArticle: $idArticle, libelle: $libelle, montant: $montant, quantite: $quantite, quantiteStock: $quantiteStock, prix: $prix, photo: $photo)';
  }

  @override
  bool operator ==(covariant ProduitPanier other) {
    if (identical(this, other)) return true;
  
    return 
      other.idArticle == idArticle &&
      other.libelle == libelle &&
      other.montant == montant &&
      other.quantite == quantite &&
      other.quantiteStock == quantiteStock &&
      other.prix == prix &&
      other.photo == photo;
  }

  @override
  int get hashCode {
    return idArticle.hashCode ^
      libelle.hashCode ^
      montant.hashCode ^
      quantite.hashCode ^
      quantiteStock.hashCode ^
      prix.hashCode ^
      photo.hashCode;
  }
}


class ProduitCatalogue {
    int id;
     String libelle;
     double? ancienPrix;
     double nouveauPrix;
     bool? promo;
     int qteStock;
     String? photo;
     int?  qteComd;
  ProduitCatalogue({
    required this.id,
    required this.libelle,
    this.ancienPrix,
    required this.nouveauPrix,
    this.promo,
    required this.qteStock,
    this.photo,
    this.qteComd
  });

  ProduitCatalogue copyWith({
    int? id,
    String? libelle,
    double? ancienPrix,
    double? nouveauPrix,
    bool? promo,
    int? qteStock,
    String? photo,
  }) {
    return ProduitCatalogue(
      id: id ?? this.id,
      libelle: libelle ?? this.libelle,
      ancienPrix: ancienPrix ?? this.ancienPrix,
      nouveauPrix: nouveauPrix ?? this.nouveauPrix,
      promo: promo ?? this.promo,
      qteStock: qteStock ?? this.qteStock,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'libelle': libelle,
      'ancienPrix': ancienPrix,
      'nouveauPrix': nouveauPrix,
      'promo': promo,
      'qteStock': qteStock,
      'photo': photo,
    };
  }

  factory ProduitCatalogue.fromMap(Map<String, dynamic> map) {
    return ProduitCatalogue(
      id: map['id'] as int,
      libelle: map['libelle'] as String,
      ancienPrix: map['ancienPrix'] != null ? map['ancienPrix'] as double : null,
      nouveauPrix: map['nouveauPrix'] as double,
      promo: map['promo'] != null ? map['promo'] as bool : null,
      qteStock: map['qteStock'] as int,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProduitCatalogue.fromJson(String source) => ProduitCatalogue.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Produit(id: $id, libelle: $libelle, ancienPrix: $ancienPrix, nouveauPrix: $nouveauPrix, promo: $promo, qteStock: $qteStock, photo: $photo)';
  }


  @override
  bool operator ==(covariant ProduitCatalogue other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.libelle == libelle &&
      other.ancienPrix == ancienPrix &&
      other.nouveauPrix == nouveauPrix &&
      other.promo == promo &&
      other.qteStock == qteStock &&
      other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      libelle.hashCode ^
      ancienPrix.hashCode ^
      nouveauPrix.hashCode ^
      promo.hashCode ^
      qteStock.hashCode ^
      photo.hashCode;
  }
}
