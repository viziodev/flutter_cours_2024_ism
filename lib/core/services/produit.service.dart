import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/repositories/produit.repository.dart';

class ProduitService {
   static ProduitRepository produitRepository=ProduitRepository();
    static Future<List<Produit>>  findAll() async{
      return  await produitRepository.findAll();
   }
     
}