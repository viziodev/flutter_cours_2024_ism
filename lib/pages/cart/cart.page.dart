
import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/components/widget.bar.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/models/client.model.dart';
import 'package:flutter_cours_2024_ism/core/providers/cart.providers.dart';
import 'package:flutter_cours_2024_ism/core/repositories/produit.repository.dart';
import 'package:flutter_cours_2024_ism/core/services/login_service.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart_bottom.dart';
import 'package:flutter_cours_2024_ism/pages/login/login.page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String routeName="/cart";
  @override
  Widget build(BuildContext context) {
    final ProduitRepository produitRepository=ProduitRepository();
   final dataProvider = Provider.of<CartPovider>(context, listen: true);
    return Scaffold(
      appBar:  MyAppBar(title: "Produits du Panier",),
       body:  SafeArea(
         child:  SingleChildScrollView(
           child:  Column(
            children: [
           
            const SizedBox(
                    height: 20.0,
                  ),
            for (int i = 0; i <dataProvider.cart.articlesPanier.length; i++)
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        height: 140,
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
                                 dataProvider.cart.articlesPanier[i].photo!,
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
                                  vertical: 10, horizontal: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataProvider.cart.articlesPanier[i].libelle,
                                     style: const TextStyle(
                                          color: bbwPrimaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          
                                        ), 
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                 
                                      RichText(
                                        text:  TextSpan(
                                          text: "Prix :  ",
                                           style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ), 
                                          children: [           
                                          TextSpan(text: "${dataProvider.cart.articlesPanier[i].prix} CFA",
                                             style: const TextStyle(
                                             color: bbwPrimaryColor,
                                             fontSize: 15,
                                             fontWeight: FontWeight.bold,),
                                          
                                            )
                                        
                                          ]
                                        ),
                                        
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                  
                                      RichText(
                                        text:  TextSpan(
                                          text: "Qte :  ",
                                           style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ), 
                                          children: [           
                                          TextSpan(text: "${dataProvider.cart.articlesPanier[i].quantite} ",
                                             style: const TextStyle(
                                             color: bbwPrimaryColor,
                                             fontSize: 15,
                                             fontWeight: FontWeight.bold,),
                                          
                                            )
                                        
                                          ]
                                        ),
                                        
                                      ),
                                      
                                    ],
                                  ),
                                   const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                 
                                      RichText(
                                        text:  TextSpan(
                                          text: "Montant :  ",
                                           style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ), 
                                          children: [           
                                          TextSpan(text: "${dataProvider.cart.articlesPanier[i].montant} CFA",
                                             style: const TextStyle(
                                             color: bbwPrimaryColor,
                                             fontSize: 20,
                                             fontWeight: FontWeight.bold,),
                                          
                                            )
                                        
                                          ]
                                        ),
                                        
                                      ),
                                      const SizedBox(
                                        width: 20.0,
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
              
           ],
           )
           )),
           bottomNavigationBar:   CartBottom(total:dataProvider.cart.total,savePanier:() {
              if (LoginService.user!=null)  {
               dataProvider.cart.client=ClientModel(id: LoginService.user!.id,nomComplet: "",telephone: "");
                  produitRepository.add(dataProvider.cart);
                  dataProvider.clearCart();
             }else{
                  Navigator.pop(context);
                  Navigator.pushNamed(context, LoginOrRegisterPage.routeName);
             }
                 
           }, ), 
    );
  }
}