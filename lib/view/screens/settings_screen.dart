import 'package:flutter/material.dart';
 class SettingsScreen extends StatefulWidget {

   const SettingsScreen({super.key});

   @override
   State<SettingsScreen> createState() => _SettingsScreenState();
 }

 class _SettingsScreenState extends State<SettingsScreen> {
   late Color myColor;
   @override
   Widget build(BuildContext context) {
     myColor = Theme.of(context).primaryColor;
     return Scaffold(
       appBar: AppBar(
         backgroundColor: myColor,
         title: const Text('Settings',
           style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 20,
           ),
         ),
       ),
       body: const Center(
         child: Text('Settings'),
       ),
     );
   }
 }
