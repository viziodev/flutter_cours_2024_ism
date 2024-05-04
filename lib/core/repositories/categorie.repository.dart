import 'package:dio/dio.dart';
import 'package:flutter_cours_2024_ism/core/constantes/api.constante.dart';
import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';

class CategorieRepository  {
   static const url="$apiUrl/categories" ;
   static  Dio dio=Dio();
    Future<List<Categorie>> findAll() async{ 
          final response= await dio.get(url);
          if (response.statusCode==200) {
              List<dynamic> datas=response.data["results"];
              List<Categorie> categories=[];
              for (var map in datas) {
                  categories.add(Categorie.fromMap(map));
              }
               return   categories;
           }else{
                 throw response;
           }

          
       
    }
}