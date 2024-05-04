// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/services/produit.service.dart';

class ProduitList extends StatelessWidget {
      const ProduitList({super.key });
  @override
  Widget build(BuildContext context) {
     List<Produit> produits= ProduitService.findAll();

     return Container(
      height:MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 4),
       child: GridView.builder(  
                itemCount: produits.length,  
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                    crossAxisCount: 2,  
                    crossAxisSpacing: 4.0,  
                    mainAxisSpacing: 4.0  
                ),  
                itemBuilder: (BuildContext context, int index){  
                      return  //Container(child: Text("tttt"),);
                     ProduitItem(produit:produits[index] , callback: () {},);
                }, 
       ),
     );
  
        
}
}


class ProduitItem extends StatelessWidget {
  Produit produit;
   VoidCallback callback;
  ProduitItem({
    Key? key,
    required this.produit,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
             decoration: BoxDecoration(
               color: bbwSecondaryColor.withOpacity(0.1),
               borderRadius: BorderRadius.circular(12),
             ),
     width: 150,
     height: 180,
     child: GestureDetector(
     onTap: callback,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         AspectRatio(
           aspectRatio: 1.5,
           child: Container(
            padding: const EdgeInsets.only(top:2),
             decoration:  const BoxDecoration(
               color:  Colors.amber,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(12) ,topRight: Radius.circular(12)),
             ),
             child: Image.asset(produit.photo!),
           ),
         ),
         const SizedBox(height: 8),
         Text(
           produit.libelle,
           style: Theme.of(context).textTheme.bodyMedium,
           maxLines: 2,
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
              Text(
               "${produit.prix} CFA",
               style: const TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.bold,
                 color: bbwPrimaryColor,
               ),
             ),
             InkWell(
               borderRadius: BorderRadius.circular(50),
               onTap: () {},
               child: Container(
                 padding: const EdgeInsets.all(6),
                 height: 24,
                 width: 24,
                 decoration: BoxDecoration(
                   color: bbwPrimaryColor.withOpacity(0.15)  ,
                   shape: BoxShape.circle,
                 ),
                 child: SvgPicture.asset(
                   "assets/icons/Heart Icon_2.svg",
                   colorFilter: const ColorFilter.mode(
                              Color(0xFFDBDEE4),
                       BlendMode.srcIn),
                 ),
               ),
             ),
           ],
         )
       ],
     ),
          ),
        );
  }
}