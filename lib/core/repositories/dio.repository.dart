import 'package:dio/dio.dart';
import 'package:flutter_cours_2024_ism/core/constantes/api.constant.dart';

class DioRepository {
  static final dio = Dio();
  //GET
  static Future<Response> getData(String path,{Map<String,dynamic>? params}) async{
   //On construit l'url
     String url = apiUrl+ path;
     //Appel Asynchrone
     final response = await dio.get(url,queryParameters:params );
     
   if (response.statusCode == 200) {
      return response;
   } else {
       throw response;
  }

  }
  //POST

 
  //DELETE
}