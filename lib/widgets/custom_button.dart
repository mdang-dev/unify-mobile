import 'package:flutter/material.dart';

class CustomButtomRectangle extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButtomRectangle(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.368,
              vertical: MediaQuery.of(context).size.width * 0.0005)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
