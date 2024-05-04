import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';
import 'package:flutter_cours_2024_ism/core/repositories/categorie.repository.dart';

class CategorieService {

 static   Future<List<Categorie>> findAll() async{
          List<Categorie> categories=await   CategorieRepository().getAllCategories();
          return categories;
   /* return [
       Categorie(icon: "assets/icons/Flash Icon.svg",id: 1, libelle: "Sac"),
       Categorie(icon: "assets/icons/Bill Icon.svg",id: 2, libelle: "Sac1"),
       Categorie(icon: "assets/icons/Game Icon.svg",id: 3, libelle: "Sac3"),
       Categorie(icon: "assets/icons/Gift Icon.svg",id: 2, libelle: "Sac1"),
       Categorie(icon: "assets/icons/Gift Icon.svg",id: 2, libelle: "Sac1"),
       Categorie(icon: "assets/icons/Flash Icon.svg",id: 2, libelle: "Sac1"),
      ];*/
   }
  
}