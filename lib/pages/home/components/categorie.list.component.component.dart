import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/constantes/size.constants.dart';
import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';
import 'package:flutter_cours_2024_ism/core/services/categorie.service.dart';

class CategorieList extends StatefulWidget {
  const CategorieList({super.key});

  @override
  State<CategorieList> createState() => _CategorieListState();
}

class _CategorieListState extends State<CategorieList> {
     List<Categorie> categories=CategorieService.findAll();
     int categorieSelected=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: bbwPadding),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
              scrollDirection:Axis.horizontal ,
               itemCount: categories.length,
                itemBuilder:(context, index) {
                   return  categorieItem(index);
                },
          ),
      )
    );
  }

   categorieItem(int index){
      return InkWell(
         onTap: () {
            setState(() {
                  categorieSelected=index;
            });
         },
        child: Container(
          
                      decoration: BoxDecoration(
                       color:bbwPrimaryColor,
                       borderRadius: BorderRadius.circular(10)
                      ),
                   
                      height: 50,
                      margin: const EdgeInsets.all(5),
                     padding: const EdgeInsets.all(bbwPadding),
                        child: Center(child: Text(categories[index].libelle,
                        style:  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                            color: categorieSelected==index ? Colors.black: Colors.white
                        
                        ),
                      
                        )),
                        
                      ),
      ); 
}

}