import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart.page.dart';
import 'package:flutter_cours_2024_ism/pages/home/home.page.dart';
import 'package:flutter_cours_2024_ism/pages/produit_categorie/produit.categorie.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      initialRoute: "/home",
      routes: {  
        "/home":(context)=> const HomePage(),
        "/cart":(context)=> const CartPage(),
        "/categorie":(context)=>  ProduitCategoriePage(categorieId: 1)
      },
      home: const HomePage() ,
    );
  }
}




