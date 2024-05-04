
import 'package:dio/dio.dart';
import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';
import 'package:flutter_cours_2024_ism/core/repositories/dio.repository.dart';

class CategorieRepository {
   static final dio = Dio();
    Future<List<Categorie>> getAllCategories() async {
     //Appel Asynchrone
     final response = await dio.get("http://localhost:10004/api/categories");
    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      List<Categorie> categories = [];
      for (dynamic map in results) {
           Categorie cat = Categorie.fromMap(map);
            categories.add(cat);
      }
      return categories;
    } else {
      throw response;
    }
  }
}