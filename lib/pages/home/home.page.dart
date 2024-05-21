import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/components/appbar.component.dart';
import 'package:flutter_cours_2024_ism/core/components/text.component.dart';
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
     Future<List<Produit> >produitsFuture= ProduitService.findAll();
  return Scaffold(
        appBar: BbwAppBar(title: "Home Page",) ,
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
                
                 const CategorieList(),
                 headerText(title: "Catalogue de Produit",color: Colors.black),
                  ProduitList(produitsFuture: produitsFuture)
            ],),
         ),
       )

    );
  }
}