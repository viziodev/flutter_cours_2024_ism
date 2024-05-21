import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/components/appbar.component.dart';
import 'package:flutter_cours_2024_ism/core/components/text.component.dart';
import 'package:flutter_cours_2024_ism/core/models/categorie.models.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/services/produit.service.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart.page.dart';
import 'package:flutter_cours_2024_ism/core/components/produit.list.component.dart';


import 'package:flutter_cours_2024_ism/pages/home/home.page.dart';



class ProduitCategoriePage extends StatefulWidget {
  Categorie categorie;
  ProduitCategoriePage({super.key,required this.categorie});
static String routeName="/categorie";

  @override
  State<ProduitCategoriePage> createState() => _ProduitCategoriePageState();
}

class _ProduitCategoriePageState extends State<ProduitCategoriePage> {
   Future<List<Produit>>?produitsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     produitsFuture = ProduitService.findByCategorie(widget.categorie.id);
     produitsFuture!.then((value) => {
        //  print(value)
     });
  }
  @override
  Widget build(BuildContext context) {

  

  return Scaffold(
        appBar:  BbwAppBar(title: "Produit de  ${widget.categorie.libelle}",),
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
                 const SizedBox(height: 20,),
                 ProduitList(produitsFuture:produitsFuture!),
           
            ],),
         ),
       )

    );
  }
}