import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String routeName="/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
          title: const Text("Panier"),
           actions: [
            IconButton(onPressed: (){
                  Navigator.pushNamed(context, CartPage.routeName);
            }, icon: const Icon(Icons.shopping_cart,color: Colors.amber,))
          ],
       ),
    );
  }
}