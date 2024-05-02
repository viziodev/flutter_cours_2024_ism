import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/constantes/size.constants.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/services/produit.service.dart';

class ProduitList extends StatelessWidget {
      const ProduitList({super.key });
  @override
  Widget build(BuildContext context) {
     List<Produit> produits= ProduitService.findAll();
     return  Container(
      height: 450,
       child: GridView.count(
        crossAxisCount:2 , 
        crossAxisSpacing: 4.0,  
         mainAxisSpacing: 8.0,  
        children: List.generate(produits.length, (index) {  
                    return Center(  
                      child: ProduitItem(produit: produits[index], callback:() {
                        
                      },),  
                    );  
                  }  
        )  
        ),
     );
  }
}


class ProduitItem extends StatefulWidget {
  Produit produit;
   VoidCallback callback;
   ProduitItem({super.key,required this.produit,required this.callback});

  @override
  State<ProduitItem> createState() => _ProduitItemState();
}

class _ProduitItemState extends State<ProduitItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
               height: 400,
               width: 180,
            decoration: BoxDecoration(
                       color:bbwPrimaryColor,
                       borderRadius: BorderRadius.circular(15)
                      
                      ),
         padding: const EdgeInsets.all(bbwPadding),
         child: Hero(
        
                 tag:"${widget.produit.id}" , 
                 child: Text(widget.produit.libelle)
                ),

      ),
    );
  }
}