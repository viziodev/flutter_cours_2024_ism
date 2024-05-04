import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/constantes/size.constants.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart.page.dart';
import 'package:flutter_cours_2024_ism/pages/home/components/categorie.list.component.dart';
import 'package:flutter_cours_2024_ism/pages/home/components/produit.list.component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
static String routeName="/home";
  @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
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
       body:  const SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(vertical: 16),
          child: Column(
          
            children: [
              CategorieList(),
             // const  SizedBox(height: 2),
              ProduitList()
              //ProduitItem(callback:() {}, produit:  Produit(id: 1, libelle: "Sac",prix:1000,photo: "assets/images/glap.png"))
            ]
          ),
        ),
      ),

    );
  }
}