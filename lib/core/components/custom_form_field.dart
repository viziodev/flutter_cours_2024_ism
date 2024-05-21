import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.hintText,
    this.obscureText,
    this.controller,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: 4.4 * MediaQuery.of(context).size.width / 5,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 6.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText??false,
            decoration: InputDecoration.collapsed(
              filled: true,
              fillColor: Colors.transparent,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
