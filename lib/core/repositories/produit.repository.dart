import 'package:dio/dio.dart';
import 'package:flutter_cours_2024_ism/core/constantes/api.constante.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class ProduitRepository  {
   static var url="$apiUrl/articles" ;
   static  Dio dio=Dio();
    Future<List<Produit>> findAll({String uri=""}) async{ 
           var path=url+uri;
           final response= await dio.get(path);
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