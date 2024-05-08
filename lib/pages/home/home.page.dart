import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/components/widget.bar.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/services/produit.service.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart.page.dart';
import 'package:flutter_cours_2024_ism/core/components/produit.list.component.dart';
import 'package:flutter_cours_2024_ism/pages/home/components/categorie.list.component.component.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});
static String routeName="/home";
  @override
  Widget build(BuildContext context) {
     Future<List<ProduitCatalogue> >produitsFuture= ProduitService.findAll();
  return Scaffold(
        appBar: MyAppBar(title: "Home Page",) ,
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
       body:  SafeArea(
         child: SingleChildScrollView(
           child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            children: [
             SizedBox(
               width: double.infinity,
                child: Text("Categories",style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
                textAlign: TextAlign.start,
                ),
                ),
              //Liste des Catgories
                  CategorieList(),
                //CategorieItem(categorie: Categorie(id: 1, libelle: "Sac")),
                SizedBox(
                        child: Text("Produits",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                      ),
                    ),
              
              // ProduitItem(produit:Produit(id: 1, libelle: "Sac",prix:1000,photo:""), callback: () {
             
                 // },)
                ProduitList(produitsFuture: produitsFuture)
            ],),
         ),
       )

    );
  }
}