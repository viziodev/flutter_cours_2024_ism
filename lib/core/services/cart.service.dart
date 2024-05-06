import 'package:flutter_cours_2024_ism/core/models/cart.models.dart';
import 'package:flutter_cours_2024_ism/core/models/produit.model.dart';

class CartService {
  Cart cart = Cart(products: [
     Produit(
      id: 1,
      photo: 'https://static.vecteezy.com/system/resources/thumbnails/004/580/539/small_2x/ui-ux-programmer-flat-design-illustration-vector.jpg',
      libelle: "Sandal",
      ancienPrix: 15000.0,
      nouveauPrix: 1000.0,
      promo: true,
      qteComd: 10,
      qteStock: 20,
    ),
   Produit(
      id: 2,
      photo: 'https://static.vecteezy.com/system/resources/thumbnails/004/580/539/small_2x/ui-ux-programmer-flat-design-illustration-vector.jpg',
      libelle: "Sandal",
      ancienPrix: 15000.0,
      nouveauPrix: 1000.0,
      promo: true,
      qteComd: 10,
      qteStock: 20,
    ),
  ]);

  double totalPartial(Produit product) {
    return product.qteComd! * product.nouveauPrix;
  }

  addCart(Produit product) {
    //cart.totalHtt += totalPartial(product);
    cart.products!.add(product);
  }

  void clearCart(Produit product) {
    cart = Cart(products: []);
  }

  void removeCart(Produit product) {
    cart.totalHtt -= totalPartial(product);
    cart.products =
        cart.products!.where((element) => product.id != element.id).toList();
  }

  void updateCart(Produit product, int qte) {
    int index =
        cart.products!.indexWhere((element) => product.id == element.id);
      int qteStock = cart.products![index].qteStock;
    if ((cart.products![index].qteComd! > 1) &&
        cart.products![index].qteComd! < qteStock) {
         //  cart.products![index].qteComd! += qte;
    } else if (cart.products![index].qteComd == 1 && qte == 1) {
     // cart.products![index].qteComd += qte;
    } else if (cart.products![index].qteComd == qteStock && qte == -1) {
      //cart.products![index].qteComd += qte;
    }
    cart.totalHtt += product.nouveauPrix;
  }
}