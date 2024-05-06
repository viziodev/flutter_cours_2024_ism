import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/services/produit.service.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart.page.dart';
import 'package:flutter_cours_2024_ism/core/components/produit.list.component.dart';


import 'package:flutter_cours_2024_ism/pages/home/home.page.dart';
import 'package:flutter_cours_2024_ism/pages/produit_categorie/components/seach.product.dart';



class ProduitCategoriePage extends StatelessWidget {
  int categorieId;
 ProduitCategoriePage({super.key,required this.categorieId});
static String routeName="/categorie";
  @override
  Widget build(BuildContext context) {
   Future<List<Produit> >produitsFuture= ProduitService.findAllByCategorie(categorieId);
  return Scaffold(
        appBar: AppBar(
          title: const Text("Produit une Categorie"),
           actions: [
            IconButton(onPressed: (){
                  Navigator.pushNamed(context, CartPage.routeName);
            }, icon: const Icon(Icons.shopping_cart,color: Colors.amber,))
          ],
       ),
        drawer: Drawer(
        child: ListView(
    // Important: Remove any padding from the ListView.
           padding: EdgeInsets.zero,
    children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
                Navigator.pop(context);
                  Navigator.pushNamed(context, HomePage.routeName);
            },
      ),
        ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CartPage.routeName);
            },
          ),
     
     
    ],
  ),

       ),
       body:   SafeArea(
         child: SingleChildScrollView(
           child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            children:  [
             const SizedBox(
               width: double.infinity,
                child: Text("Les Produits de la categorie",style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
                textAlign: TextAlign.justify,
                ),
                ),
               
                  SearchProduit(onChange: (value) {
                    // produitsFuture= ProduitService.findAllByCategorie(2);
                    // Navigator.popAndPushNamed(context,"/categorie",arguments: 2);
                  },),
                 ProduitList(produitsFuture:produitsFuture),
           
            ],),
         ),
       )

    );
  }
}