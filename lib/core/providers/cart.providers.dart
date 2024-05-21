import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/models/cart.model.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class CartProvider  with ChangeNotifier{
    final Cart _cart=Cart(articlesPanier: [], total: 0);
     Cart get cart=>_cart;

     addCart(Produit produit){
      ArticleCart articleCart=ArticleCart.fromProduitCatalogue(produit);
      int pos=  _cart.articlesPanier.indexWhere((element) => element.idArticle==articleCart.idArticle);
         articleCart.montant=articleCart.prix* articleCart.quantite;
       if (pos==-1) {
           _cart.articlesPanier.add(articleCart);
       }else{
         _cart.articlesPanier[pos].quantite++;
           _cart.articlesPanier[pos].montant=  _cart.articlesPanier[pos].quantite*articleCart.prix;
       }
        _cart.total+= articleCart.montant!;
        notifyListeners();
     }
    
}