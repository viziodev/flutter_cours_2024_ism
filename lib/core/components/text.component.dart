import 'package:flutter/material.dart';

headerText({required String title,double size=20,Color color=Colors.grey}){
  return  SizedBox(
               width: double.infinity,
                child: Text(title,style: TextStyle(
                   fontSize: size,
                   fontWeight: FontWeight.bold,
                    color: color
                ),
                textAlign: TextAlign.start,
   ),
);
}