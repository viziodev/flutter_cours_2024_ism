import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/providers/cart.providers.dart';
import 'package:provider/provider.dart';

  class MyAppBar extends StatefulWidget  implements PreferredSizeWidget{
    String title;
     MyAppBar({super.key,required this.title});
  
    @override
    State<MyAppBar> createState() => _MyAppBarState();
      @override
      Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  }
  
  class _MyAppBarState extends State<MyAppBar> {
    @override
    Widget build(BuildContext context) {
       final dataProvider = Provider.of<CartPovider>(context, listen: true);
      return AppBar(
          title:  Text(widget.title),
           actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: badges.Badge(
                badgeContent: Text(
                  "${dataProvider.cart.articlesPanier.length}",
                  style: const TextStyle(color: Colors.white),
                ),
                  badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.red,
                  padding: const EdgeInsets.all(6.0),
                  borderRadius: BorderRadius.circular(4),
                 ),
                 child: InkWell(
                  onTap:() {
                     Navigator.pushNamed(context, "/cart");
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: bbwPrimaryColor,
                  ),
                ),
              ),
            )
          ],
       );
    }
  }



Text higgerText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
        color: bbwPrimaryColor, fontSize: 23, fontWeight: FontWeight.bold),
  );
}