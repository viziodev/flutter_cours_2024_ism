import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/models/cart.model.dart';

class CartList extends StatelessWidget {
  Cart cart;
   CartList({super.key,required this.cart});

  @override
  Widget build(BuildContext context) {
     
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: cart.articlesPanier.length,
             itemBuilder: (context, index) {
                  return   CartItem(produit:cart.articlesPanier[index] ,);
             },
          ),
      ),
    );
  }

}

class CartItem extends StatelessWidget {
  ArticleCart produit;
  CartItem({super.key, required this.produit});
   //Photo    Prix :    qte:  
   //         Total: 
    @override
     Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 420,
            height: 140,
             decoration: BoxDecoration(
             color: bbwSecondaryColor.withOpacity(0.4),
             borderRadius: BorderRadius.circular(16)
             ),
          child: Row(
            children: [
              SizedBox(
                  height: double.infinity,
                  width: 110,
                  child:  ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),
                     bottomLeft: Radius.circular(12) ) ,
                      child:   Image.network(produit.photo?? "https://static.vecteezy.com/system/resources/thumbnails/004/580/539/small_2x/ui-ux-programmer-flat-design-illustration-vector.jpg",
                      width:  double.maxFinite,
                      fit: BoxFit.cover,
                  ),
                  ),
               ) ,
               const SizedBox(width: 10,)  ,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2,vertical:20),
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text(produit.libelle,
                       style: const TextStyle(fontSize: 20),),
                         const SizedBox(width: 100,),  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Text("Qte:${produit.quantite}",style: const TextStyle(fontSize: 20),),
                         const SizedBox(width: 100,),  
                       Text("${produit.prix}",style: const TextStyle(fontSize: 20),)
                    ],),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Text("Total:${produit.montant}",style: const TextStyle(fontSize: 20),)
                    ],)
                    
                  ],
                ),
              )     
            ],),
        ),
      );
  }
}