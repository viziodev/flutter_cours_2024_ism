import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/components/drawer.widget.dart';
import 'package:flutter_cours_2024_ism/core/components/widget.bar.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/core/services/produit.service.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart.page.dart';
import 'package:flutter_cours_2024_ism/core/components/produit.list.component.dart';
import 'package:flutter_cours_2024_ism/pages/home/components/categorie.list.component.component.dart';
import 'package:flutter_cours_2024_ism/pages/login/login.page.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});
static String routeName="/home";
  @override
  Widget build(BuildContext context) {
     Future<List<ProduitCatalogue> >produitsFuture= ProduitService.findAll();
  return Scaffold(
        appBar: MyAppBar(title: "Home Page",) ,
        drawer: const BbwDrawerWidget(),
         body:  SafeArea(
         child: SingleChildScrollView(
           child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const SizedBox(
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
                  const CategorieList(),
                //CategorieItem(categorie: Categorie(id: 1, libelle: "Sac")),
                const SizedBox(
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