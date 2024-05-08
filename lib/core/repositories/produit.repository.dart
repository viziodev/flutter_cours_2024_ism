import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_cours_2024_ism/core/constantes/api.constante.dart';
import 'package:flutter_cours_2024_ism/core/models/cart.models.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class ProduitRepository  {
   static const url="$apiUrl/articles" ;
   static  Dio dio=Dio();
    Future<List<ProduitCatalogue>> findAll({String uri=''}) async{ 
           var path=url+uri;
           print(path);
          final response= await dio.get(path);
          if (response.statusCode==200) {
              List<dynamic> datas=response.data["results"];
              List<ProduitCatalogue> produits=[];
              for (var map in datas) {
                  produits.add(ProduitCatalogue.fromMap(map));
              }
               return   produits;
           }else{
                 throw response;
           }
       
    }

  Future<void> add(Cart cart) async{
           var path="$apiUrl/commandes";
             dio.post(
              path,
              data: cart.toJson(),
              options: Options(
             followRedirects: false,
              validateStatus: (status) {
              return status! < 500;
               },
            headers: {
             HttpHeaders.contentTypeHeader: "application/json",
            },
          ),
        );
   
        
    }
}