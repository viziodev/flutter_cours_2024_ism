import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/constantes/size.constants.dart';
import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';
import 'package:flutter_cours_2024_ism/core/services/categorie.service.dart';
import 'package:flutter_svg/svg.dart';

class CategorieList extends StatefulWidget {
  const CategorieList({super.key});

  @override
  State<CategorieList> createState() => _CategorieListState();
}

class _CategorieListState extends State<CategorieList> {
  List<Categorie> categories=[];
  @override
  void initState() async{
    super.initState();
       CategorieService.findAll().then((value) => categories=value);
  }
   
     
     int categorieSelected=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.all(bbwPadding),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder:(context, index) => categorieItem(index),
            ),
        )
    );
  }

   categorieItem(int index){
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: InkWell(
          onTap: (){
         
          },
           child: Column(
             children: [
               Container(
                 padding: const EdgeInsets.all(16),
                 height: 56,
                 width: 56,
                 decoration: BoxDecoration(
                   color: const Color(0xFFFFECDF),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: SvgPicture.asset(categories[index].icon),
               ),
               const SizedBox(height: 4),
               Text(categories[index].libelle, textAlign: TextAlign.center)
             ],
           ),
         ),
       );
}

}