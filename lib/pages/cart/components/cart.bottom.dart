import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';

class CartBottom extends StatefulWidget {
       VoidCallback onSave;
       double total;
      CartBottom({super.key,required this.onSave,required this.total});

  @override
  State<CartBottom> createState() => _CartBottomState();
}

class _CartBottomState extends State<CartBottom> {
    

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 150,
      child: Container(
       child:Column(
        children: [
            Container(
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(12), 
               color: bbwPrimaryColor,
              ),
              height: 50,
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(child: Text("Total:  ",style: const TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.w200
                                  )),),
                  ),
                   SizedBox(width: 40,),
                  Container(child:Text("${widget.total} CFA ", style: const TextStyle(
                     fontSize: 20,
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                )), )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                    onPressed:() => widget.onSave(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('Terminer!',style: const TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       color: Colors.black
                                  )),
                       ),
            ),
        ],
       ) ,
      ),
    );
  }
}