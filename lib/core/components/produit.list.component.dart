import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/models/cart.models.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/services/cart.service.dart';


class ProduitList extends StatelessWidget {
       Future<List<Produit> >produitsFuture;
      
       
       ProduitList({super.key ,required  this.produitsFuture} );
  @override
  Widget build(BuildContext context) {
     CartService cartService = new CartService();
  
     return  FutureBuilder<List<Produit> >(
        future:  produitsFuture ,
                  builder:(context, snapshot) {
                       if (snapshot.hasData) {
                           return  SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: GridView.count(
                                crossAxisCount:2 , 
                                crossAxisSpacing: 4.0,  
                                mainAxisSpacing: 4.0,  
                                children: List.generate(snapshot.data!.length, (index) {  
                                    return Center(  
                                      child: ProduitItem(produit: snapshot.data![index], callback:() {
                                           cartService.addCart( snapshot.data![index]) ; 
                                      },),  
                                    );  
                    }  
                      )  
                     ),
                     );
                       }else{
                         return const Center(child: Text("Pas Donnees"),);
                       }
                  }
    
     );
  }
}

class ProduitItem extends StatelessWidget {
     Produit produit;
    VoidCallback callback;
   ProduitItem({super.key,required this.produit,required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
             width:  170,
             height: 180,
            decoration: BoxDecoration(
                     color:bbwPrimaryColor.withOpacity(0.8),
                     borderRadius: BorderRadius.circular(15)
                    ),
       child: Column(
        children: [
          //Image
             AspectRatio(
              aspectRatio: 1.5,
              child:Container(
                decoration:
                 const BoxDecoration(
                 
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                 ),
                 child: Image.network(
                                     //color: Colors.amber,
                                     produit.photo?? 'https://static.vecteezy.com/system/resources/thumbnails/004/580/539/small_2x/ui-ux-programmer-flat-design-illustration-vector.jpg',
                                     // height: 220.0,
                                      width: double.maxFinite,
                                      fit: BoxFit.cover,
                                    ),
              ) ,
             ),
          //Espace 
             const SizedBox(height: 5,),
               Text(produit.libelle,
               maxLines: 2,
              style: const TextStyle(fontSize: 14,
              fontWeight: FontWeight.bold,
           )),
          //Nom et Prix

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Text("${produit.ancienPrix} CFA",
               style: const TextStyle(fontSize: 14,
               fontWeight: FontWeight.bold,
               ),),
               
               GestureDetector(
                onTap: callback,
                child: Icon(Icons.shopping_cart_checkout_rounded)
                )

           ],)
        ],)
    
    );
  }
}