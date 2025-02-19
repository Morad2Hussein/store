import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key , required this.hinText, this.onChanged,  this.type, this.obscureText= false});
  final String hinText;
  final ValueChanged? onChanged;

      final TextInputType? type;
      bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20, top: 10),
      child: TextField(
        obscureText: obscureText!,

        onChanged: onChanged,
        keyboardType: type,

        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(

          hintText: hinText,
          hintStyle: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'pacifico',
          ),
          labelText:hinText,
          labelStyle: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'pacifico',
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.black,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
