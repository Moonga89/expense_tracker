import 'package:flutter/material.dart';

//Register now method
class RegisterNow extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const RegisterNow({
    super.key,
    required this.onTap,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

    );
  }
}

//Login now method
class LoginNow extends StatelessWidget {
  final Function()? onTap;
  const LoginNow({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
