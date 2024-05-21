import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/components/appbar.component.dart';
import 'package:flutter_cours_2024_ism/core/constantes/size.constants.dart';
import 'package:flutter_cours_2024_ism/core/models/cart.model.dart';
import 'package:flutter_cours_2024_ism/core/providers/cart.providers.dart';
import 'package:flutter_cours_2024_ism/core/repositories/produit.repository.dart';
import 'package:flutter_cours_2024_ism/pages/cart/components/cart.bottom.dart';
import 'package:flutter_cours_2024_ism/pages/cart/components/cart.component.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String routeName="/cart";
  @override
  Widget build(BuildContext context) {
    final cartProvider=Provider.of<CartProvider>(context,listen: true);
    return Scaffold(
      appBar:  BbwAppBar(title: "Page Panier",),
       body:  SafeArea(
        child: 
        SingleChildScrollView(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
               const SizedBox(height: bbwPadding,),
               //CartItem ()
               CartList(cart:cartProvider.cart ,)
            ],),
          ),),
             bottomNavigationBar:CartBottom(total:cartProvider.cart.total ,onSave: () {
                     cartProvider.cart.client=ClientCart(id: 2);
                     ProduitRepository().save(cartProvider.cart);
            },) ,
    );
  }
}