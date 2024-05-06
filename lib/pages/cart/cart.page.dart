import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/models/cart.models.dart';
import 'package:flutter_cours_2024_ism/core/services/cart.service.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String routeName="/cart";
  @override
  Widget build(BuildContext context) {
      CartService cartService = new CartService();
       Cart? cart=cartService.cart;
    return Scaffold(
      appBar:   AppBar(
          title: const Text("Panier"),
           actions: [
            IconButton(onPressed: (){
                  Navigator.pushNamed(context, CartPage.routeName);
            }, icon: const Icon(Icons.shopping_cart,color: Colors.amber,))
          ],
       ),
       body:  SafeArea(
         child:  SingleChildScrollView(
           child:  Column(children: [
            SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Liste des Produits",
                     style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ), 
                  ),
             
                  const SizedBox(
                    height: 16.0,
                  ),
            for (int i = 0; i <cart.products!.length; i++)
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        height: 110,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                                    
                            SizedBox(
                              height: double.infinity,
                              width: 110,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  bottomLeft: Radius.circular(12.0),
                                ),
                                child: Image.network(
                                 cart.products![i].photo!,
                                  height: 220.0,
                                  width: double.maxFinite,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Analyst Course',
                                     style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ), 
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Kiyoko Shimizu",
                                       style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ), 
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      Text(
                                        "16 Video",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ), 
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      
                      
                          ],
                        ),
                      ),
                    ),
                  ),
           ],)
           )),
    );
  }
}