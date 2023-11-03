
import 'package:expense_tracker/controller/nav.dart';
import 'package:expense_tracker/view/screens//home_page.dart';
import 'package:expense_tracker/view/screens/login_or_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  final Function()? onTap;
  const AuthenticationPage({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          //checking if the user logged in
          if(snapshot.hasData){
            return Nav();

          }
          //User not logged
          else{
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
