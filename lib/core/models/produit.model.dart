// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';

class Produit {
    int id;
     String libelle;
     double? ancienPrix;
     double nouveauPrix;
     bool? promo;
     int qteStock;
     String? photo;
     Categorie categorie;
     int? qteComd; 

  Produit({
    required this.id,
    required this.libelle,
    this.ancienPrix,
    required this.nouveauPrix,
    this.promo,
    required this.qteStock,
    this.photo,
    required this.categorie,
    this.qteComd,
  });
  

  Produit copyWith({
    int? id,
    String? libelle,
    double? ancienPrix,
    double? nouveauPrix,
    bool? promo,
    int? qteStock,
    String? photo,
    Categorie? categorie,
    int? qteComd,
  }) {
    return Produit(
      id: id ?? this.id,
      libelle: libelle ?? this.libelle,
      ancienPrix: ancienPrix ?? this.ancienPrix,
      nouveauPrix: nouveauPrix ?? this.nouveauPrix,
      promo: promo ?? this.promo,
      qteStock: qteStock ?? this.qteStock,
      photo: photo ?? this.photo,
      categorie: categorie ?? this.categorie,
      qteComd: qteComd ?? this.qteComd,
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
      'categorie': categorie.toMap(),
      'qteComd': qteComd,
    };
  }

  factory Produit.fromMap(Map<String, dynamic> map) {
    return Produit(
      id: map['id'] as int,
      libelle: map['libelle'] as String,
      ancienPrix: map['ancienPrix'] != null ? map['ancienPrix'] as double : null,
      nouveauPrix: map['nouveauPrix'] as double,
      promo: map['promo'] != null ? map['promo'] as bool : null,
      qteStock: map['qteStock'] as int,
      photo: map['photo'] != null ? map['photo'] as String : null,
      categorie: Categorie.fromMap(map['categorie'] as Map<String,dynamic>),
      qteComd: map['qteComd'] != null ? map['qteComd'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produit.fromJson(String source) => Produit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Produit(id: $id, libelle: $libelle, ancienPrix: $ancienPrix, nouveauPrix: $nouveauPrix, promo: $promo, qteStock: $qteStock, photo: $photo, categorie: $categorie, qteComd: $qteComd)';
  }

  @override
  bool operator ==(covariant Produit other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.libelle == libelle &&
      other.ancienPrix == ancienPrix &&
      other.nouveauPrix == nouveauPrix &&
      other.promo == promo &&
      other.qteStock == qteStock &&
      other.photo == photo &&
      other.categorie == categorie &&
      other.qteComd == qteComd;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      libelle.hashCode ^
      ancienPrix.hashCode ^
      nouveauPrix.hashCode ^
      promo.hashCode ^
      qteStock.hashCode ^
      photo.hashCode ^
      categorie.hashCode ^
      qteComd.hashCode;
  }
}
