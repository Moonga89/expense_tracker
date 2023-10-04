import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  SaveButton({
    super.key,
    required this.onTap,
    required this.text

  });
  late Color myColor;
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 120),
        decoration: BoxDecoration(color: myColor,
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


