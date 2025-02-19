import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 50,
        decoration: BoxDecoration(
         color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          onPressed: onPressed,
          child:  Text(text, style:const TextStyle(
            color:  Colors.white,
            fontFamily: 'pacifico',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),),
        ),
      ),
    );
  }
}
