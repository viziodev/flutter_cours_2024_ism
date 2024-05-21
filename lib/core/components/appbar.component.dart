import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_cours_2024_ism/core/models/cart.model.dart';
import 'package:flutter_cours_2024_ism/core/providers/cart.providers.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart.page.dart';
import 'package:provider/provider.dart';
class BbwAppBar extends StatefulWidget implements PreferredSizeWidget {
    String title;
   BbwAppBar({super.key, required this.title});

  @override
  State<BbwAppBar> createState() => _BbwAppBarState();
  
  @override
  // TODO: implement preferredSize
   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BbwAppBarState extends State<BbwAppBar> {
  @override
  Widget build(BuildContext context) {
    final cartProvider=Provider.of<CartProvider>(context,listen: true);
    return AppBar(
          title:  Text(widget.title),
           actions: [
           Padding(
             padding: const EdgeInsets.only(right: 20.0),
             child: badges.Badge(
                       position: badges.BadgePosition.topEnd(top: 0, end: 3),
                        badgeAnimation: const badges.BadgeAnimation.slide(
                       // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
                       // curve: Curves.easeInCubic,
                       ),
                     badgeStyle: const badges.BadgeStyle(
                          badgeColor: Colors.red,
                       ),
                       badgeContent:  Text(
                       "${cartProvider.cart.articlesPanier.length}",
                        style: const TextStyle(color: Colors.white),
                      ),
                       child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, CartPage.routeName);
                        }),
                 ),
           )
          ],
       );
  }
}