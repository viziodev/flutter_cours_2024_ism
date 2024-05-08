
import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/components/widget.bar.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';

class CartBottom extends StatefulWidget {
 CartBottom({super.key,this.total=0,required this.savePanier});
 double total;
 VoidCallback savePanier;
  @override
  State<CartBottom> createState() => _CartBottomState();
}

class _CartBottomState extends State<CartBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      height: 170,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              height: 70,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                    higgerText(text: "Total :"),
                    Text("\$${widget.total}",
                    style: const TextStyle(
                        color: bbwPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))
                ],
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: widget.savePanier,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: bbwPrimaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text("Terminer la Commande",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}