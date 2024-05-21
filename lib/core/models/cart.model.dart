// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class Cart {
     List<ArticleCart> articlesPanier=[] ;
     double total;
     ClientCart? client;
     Cart({
    required this.articlesPanier,
    required this.total,
    this.client,
  });
     

  Cart copyWith({
    List<ArticleCart>? articlesPanier ,
    double? total,
    ClientCart? client,
  }) {
    return Cart(
      articlesPanier:articlesPanier  ?? this.articlesPanier,
      total: total ?? this.total,
      client: client ?? this.client,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'articlesPanier': articlesPanier.map((x) => x.toMap()).toList(),
      'total': total,
      'client': client?.toMap(),
    };
  }


  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cart(: $articlesPanier, total: $total, client: $client)';

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.articlesPanier,articlesPanier) &&
      other.total == total &&
      other.client == client;
  }

  @override
  int get hashCode => articlesPanier.hashCode ^ total.hashCode ^ client.hashCode;

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      articlesPanier: List<ArticleCart>
            .from((map['articlesPanier'] as List<ArticleCart>)
            .map<ArticleCart>((article) => ArticleCart.fromMap(article as Map<String, dynamic> ))),
      total: map['total'] as double,
      client: map['client'] != null ? ClientCart.fromMap(map['client'] as Map<String,dynamic>) : null,
    );
  }
}

class ArticleCart {
      int idArticle;
      String libelle;
      double? montant;
      double quantite;
      double quantiteStock;
      double prix;
      String? photo;
  ArticleCart({
    required this.idArticle,
    required this.libelle,
    this.montant,
    required this.quantite,
    required this.quantiteStock,
    required this.prix,
    this.photo,
  });

  ArticleCart copyWith({
    int? idArticle,
    String? libelle,
    double? montant,
    double? quantite,
    double? quantiteStock,
    double? prix,
    String? photo,
  }) {
    return ArticleCart(
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

factory ArticleCart.fromProduitCatalogue(Produit produit) {
    return ArticleCart(
      idArticle: produit.id,
      libelle: produit.libelle,
      quantite: 1,
      quantiteStock: produit.qteStock.toDouble(),
      prix: produit.nouveauPrix,
      photo: produit.photo
    );
}
  factory ArticleCart.fromMap(Map<String, dynamic> map) {
    return ArticleCart(
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

  factory ArticleCart.fromJson(String source) => ArticleCart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArticleCart(idArticle: $idArticle, libelle: $libelle, montant: $montant, quantite: $quantite, quantiteStock: $quantiteStock, prix: $prix, photo: $photo)';
  }

  @override
  bool operator ==(covariant ArticleCart other) {
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

class ClientCart {
     int id;
     String? nomComplet;
     String? telephone;
  ClientCart({
    required this.id,
    this.nomComplet,
    this.telephone,
  });

  ClientCart copyWith({
    int? id,
    String? nomComplet,
    String? telephone,
  }) {
    return ClientCart(
      id: id ?? this.id,
      nomComplet: nomComplet ?? this.nomComplet,
      telephone: telephone ?? this.telephone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nomComplet': nomComplet,
      'telephone': telephone,
    };
  }

  factory ClientCart.fromMap(Map<String, dynamic> map) {
    return ClientCart(
      id: map['id'] as int,
      nomComplet: map['nomComplet'] != null ? map['nomComplet'] as String : null,
      telephone: map['telephone'] != null ? map['telephone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientCart.fromJson(String source) => ClientCart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ClientCart(id: $id, nomComplet: $nomComplet, telephone: $telephone)';

  @override
  bool operator ==(covariant ClientCart other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nomComplet == nomComplet &&
      other.telephone == telephone;
  }

  @override
  int get hashCode => id.hashCode ^ nomComplet.hashCode ^ telephone.hashCode;
}
