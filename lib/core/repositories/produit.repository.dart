import 'package:dio/dio.dart';
import 'package:flutter_cours_2024_ism/core/constantes/api.constante.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class ProduitRepository  {
   static const url="$apiUrl/articles" ;
   static  Dio dio=Dio();
    Future<List<Produit>> findAll() async{ 
          final response= await dio.get(url);
          if (response.statusCode==200) {
              List<dynamic> datas=response.data["results"];
              List<Produit> produits=[];
              for (var map in datas) {
                  produits.add(Produit.fromMap(map));
              }
               return   produits;
           }else{
                 throw response;
           }
       
    }
}