import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class ProduitService {
   static List<Produit> findAll(){
 
    return [
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/ps4_console_white_1.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/ps4_console_white_2.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo:"assets/images/ps4_console_white_3.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/ps4_console_white_4.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/glap.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/wireless headset.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/wireless headset.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/wireless headset.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/wireless headset.png"),
      Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/wireless headset.png"),
    ];
   }
}