import 'package:flutter/material.dart';
class LogOutButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  LogOutButton({
    super.key,
    required this.onTap,
    required this.text
  });
  late Color myColor;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 140),
        decoration: BoxDecoration(color: Colors.purple,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

