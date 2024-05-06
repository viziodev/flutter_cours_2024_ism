import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';
import 'package:flutter_cours_2024_ism/core/repositories/categorie.repository.dart';
 



class CategorieService {
  static CategorieRepository categorieRepository=CategorieRepository();
     static  Future<List<Categorie>>  findAll() async{
      List<Categorie> categories=  await categorieRepository.findAll();
       return  categories ;
   }

   
  
}