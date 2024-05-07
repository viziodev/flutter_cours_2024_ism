import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/repositories/produit.repository.dart';

enum UriArticle{
  byCategorie("/categorie");
    final String value;
    const UriArticle(this.value);
}
class ProduitService {
   static ProduitRepository produitRepository=ProduitRepository();
     static Future<List<Produit>>  findAll() async{
      return  await produitRepository.findAll();
   }

   static Future<List<Produit>>  findByCategorie(int categorieId) async{
      String path="${UriArticle.byCategorie.value}/$categorieId";
      return  await produitRepository.findAll(uri:path);
   }
     
}