import 'package:flutter/material.dart';

class SearchProduit extends StatefulWidget {
    final Function(dynamic) onChange;
   const SearchProduit({super.key,required this.onChange});

  @override
  State<SearchProduit> createState() => _SearchProduitState();
}

class _SearchProduitState extends State<SearchProduit> {
  final TextEditingController searchController = TextEditingController();
 
  @override
  void dispose() {
    super.dispose();
       searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Container(
                  height: 60,
                  width: 4.4*MediaQuery.of(context).size.width/5,
                     padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 6.0,
                    ),
                    decoration:  BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                    child: TextField(
                      controller: searchController ,
                       onChanged: (value) => setState((){
                           widget.onChange(value);
                       }),
                                           keyboardType: TextInputType.name,
                                           cursorColor:  Colors.black,
                                           style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                          ),
                                          autofocus: false,
                                         
                                          decoration: const InputDecoration.collapsed(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Search Produit",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                                          ),
                                        )
                    ),
                ),
               ],);
  }
}