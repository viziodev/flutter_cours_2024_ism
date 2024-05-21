import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/services/login_service.dart';
import 'package:flutter_cours_2024_ism/pages/cart/cart.page.dart';
import 'package:flutter_cours_2024_ism/pages/home/home.page.dart';
import 'package:flutter_cours_2024_ism/pages/login/login.page.dart';

class BbwDrawerWidget extends StatelessWidget {
  const BbwDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
    // Important: Remove any padding from the ListView.
           padding: EdgeInsets.zero,
    children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, HomePage.routeName);
            },
      ),
        ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CartPage.routeName);
            },
          ),
          if (LoginService.user==null) 
            ListTile(
            leading: const Icon(Icons.login_rounded),
             title: const Text('Login Or Register'),
             onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, LoginOrRegisterPage.routeName);
             },
           ),
         if (LoginService.user!=null) 
            ListTile(
            leading: const Icon(Icons.logout),
             title: const Text('Deconnexion'),
             onTap: () {
                  LoginService.user=null;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, HomePage.routeName);
             },
           ),
     
    ],
  ),

       );
  }
}