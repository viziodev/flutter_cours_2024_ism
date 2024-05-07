import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: 10,
             itemBuilder: (context, index) {
                  return   CartItem();
             },
          ),
      ),
    );
  }

}

class CartItem extends StatelessWidget {
  Produit? produit;
  CartItem({super.key,this.produit});
   //Photo    Prix :    qte:  
   //         Total: 
    @override
     Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 420,
            height: 100,
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
                      child:  Image.network("https://static.vecteezy.com/system/resources/thumbnails/004/580/539/small_2x/ui-ux-programmer-flat-design-illustration-vector.jpg",
                      width:  double.maxFinite,
                      fit: BoxFit.cover,
                  ),
                  ),
               ) ,
               const SizedBox(width: 10,)  ,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2,vertical:20),
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Text("Produit 1",style: TextStyle(fontSize: 20),),
                         const SizedBox(width: 100,),  
                       Text("1000 Cfa",style: TextStyle(fontSize: 20),)
                    ],),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Text("Qte:10",style: TextStyle(fontSize: 20),),
                         const SizedBox(width: 100,),  
                       Text("Total:10",style: TextStyle(fontSize: 20),)
                    ],)
                    
                  ],
                ),
              )     
            ],),
        ),
      );
  }
}