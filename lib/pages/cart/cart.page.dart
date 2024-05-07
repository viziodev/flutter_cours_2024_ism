import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/components/text.component.dart';
import 'package:flutter_cours_2024_ism/core/constantes/size.constants.dart';
import 'package:flutter_cours_2024_ism/pages/cart/components/cart.component.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String routeName="/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
          title: const Text("Panier"),
           actions: [
 
          ],
       ),
       body: SafeArea(
        child: 
        SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
             headerText(title: "Liste des Produits du panier"),
               const SizedBox(height: bbwPadding,),
               //CartItem ()
              const CartList()
            ],),
          ),),
    );
  }
}