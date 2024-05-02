import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class ProduitService {
   static List<Produit> findAll(){
    return [
      Produit(id: 1, libelle: "Sac",prix:1000,photo:""),
      Produit(id: 1, libelle: "Sac",prix:1000,photo:""),
      Produit(id: 1, libelle: "Sac",prix:1000,photo:""),
      Produit(id: 1, libelle: "Sac",prix:1000,photo:""),
      Produit(id: 1, libelle: "Sac",prix:1000,photo:""),
      Produit(id: 1, libelle: "Sac",prix:1000,photo:""),
    ];
   }
}