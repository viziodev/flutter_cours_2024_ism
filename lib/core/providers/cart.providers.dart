
import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/models/cart.models.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class CartPovider extends ChangeNotifier {
  final Cart _cart = Cart(total: 0,articlesPanier:[]);
  Cart get cart => _cart;

  addCart(ProduitCatalogue productCatalogue) {
    ProduitPanier product= ProduitPanier.fromProduitCatalogue(productCatalogue);
    int pos =
        _cart.articlesPanier.indexWhere((element) => element.idArticle == product.idArticle);
        product.montant=product.quantite*product.prix;
    if (pos == -1) {
       // product.quantite = 1;
       product.montant= product.quantite*product.prix;
      _cart.articlesPanier.add(product);

    } else {
      _cart.articlesPanier[pos].quantite= _cart.articlesPanier[pos].quantite + 1;
    }
    _cart.total +=  product.montant!;
    notifyListeners();
  }

  clearCart() {
    _cart.articlesPanier.clear();
    notifyListeners();
  }

  removeCart(ProduitPanier product) {
    if (product.quantite! > 1) {
      int pos =
          _cart.articlesPanier.indexWhere((element) => element.idArticle == product.idArticle);
      if (pos != -1) {
      //  _cart.productList[pos].qteComd! -= 1;
      }
    } else {
      _cart.articlesPanier = _cart.articlesPanier
          .where((element) => product.idArticle == element.idArticle)
          .toList();
    }
    notifyListeners();
  }
}