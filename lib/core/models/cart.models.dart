import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class Cart {
  List<Produit>? products = [];
  double totalHtt;
  double totalTtc;
  final double TVA=0.18;

   Cart({
      this.products,
      this.totalHtt=0,
      this.totalTtc=0,
  });

  
}