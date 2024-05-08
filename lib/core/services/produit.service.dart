import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/repositories/produit.repository.dart';


enum UriArticle {
  byCategorie("/categorie");
  final String value;
  const UriArticle(this.value);
}
class ProduitService {
   static ProduitRepository produitRepository=ProduitRepository();
    static Future<List<ProduitCatalogue>>  findAll() async{
      return  await produitRepository.findAll();
   }

   static Future<List<ProduitCatalogue>>  findAllByCategorie(int categorieId) async{
         var path="${UriArticle.byCategorie.value}/$categorieId";
         
          return  await produitRepository.findAll(uri:path );
   }
}