// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_cours_2024_ism/core/models/client.model.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class Cart {

  List<ProduitPanier> articlesPanier = [];
  double total;
  ClientModel? client;
  Cart({
    required this.articlesPanier,
    required this.total,
    this.client,
  });
  

  Cart copyWith({
    int? id,
    List<ProduitPanier>? articlesPanier,
    double? total,
    ClientModel? client,
  }) {
    return Cart(
      articlesPanier: articlesPanier ?? this.articlesPanier,
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

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      articlesPanier: List<ProduitPanier>.from((map['articlesPanier'] as List<ProduitPanier>).map<ProduitPanier>((x) => ProduitPanier.fromMap(x as Map<String,dynamic>),),),
      total: map['total'] as double,
      client: map['client'] != null ? ClientModel.fromMap(map['client'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart( articlesPanier: $articlesPanier, total: $total, client: $client)';
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.articlesPanier, articlesPanier) &&
      other.total == total &&
      other.client == client;
  }

  @override
  int get hashCode {
    return 
      articlesPanier.hashCode ^
      total.hashCode ^
      client.hashCode;
  }
}
