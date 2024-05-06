import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/constantes/size.constants.dart';
import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';
import 'package:flutter_cours_2024_ism/core/services/categorie.service.dart';
import 'package:flutter_cours_2024_ism/pages/produit_categorie/produit.categorie.page.dart';

  class CategorieList extends StatefulWidget {
  const CategorieList({super.key});
  
  @override
  State<CategorieList> createState() => _CategorieListState();
}

class _CategorieListState extends State<CategorieList> {
  Future<List<Categorie> >futureCategories=CategorieService.findAll();

    @override
    void initState()  {
      super.initState();
          
      }

     

   @override
  Widget build(BuildContext context)  {
     
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: bbwPadding),
                child: FutureBuilder<List<Categorie>>(
                  future:  futureCategories ,
                  builder:(context, snapshot) {
                     if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                     } else   if (snapshot.hasData) {
                          return SizedBox(
                             height: 110,
                             child: ListView.builder(
                              scrollDirection:Axis.horizontal ,
                             itemCount: snapshot.data!.length,
                             itemBuilder:(context, index) {
                              return  CategorieItem(categorie:snapshot.data![index]);
                           },
                           ),
                        );
                    } else {
                         return const Center(child: Text("Pas Donnees"),);
                    }
                      
                  },
                )
    );
  }
}

class CategorieItem extends StatefulWidget {
  Categorie categorie;
   CategorieItem({super.key, required this.categorie});

  @override
  State<CategorieItem> createState() => _CategorieItemState();
}
//Icon 
//Label
class _CategorieItemState extends State<CategorieItem> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
           Navigator.pushNamed(context,ProduitCategoriePage.routeName,arguments: 1);
        },
        child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
          children: [
            Container(
                 height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: bbwPrimaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Icon(Icons.shape_line,color: Colors.white,),
            ),
            const SizedBox(height: 4),
                Text(widget.categorie.libelle,textAlign:TextAlign.center,
               style: const TextStyle(
                   fontSize: 12
              ),)
        
          ],
        ),
      ),
    );
  }
}
