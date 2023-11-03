import 'package:expense_tracker/view/screens/home_page.dart';
import 'package:expense_tracker/view/screens/settings_screen.dart';
import 'package:expense_tracker/view/screens/statistics_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final Function()? onTap;
  const BottomNavigation({
    super.key,
    required this.onTap
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();


}

void signOut(){
  FirebaseAuth.instance.signOut();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late Color myColor;
  //declare current index
  int _currentIndex = 0;

  final screens =  [
    const HomePage(),
    const StatsScreen(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(

        backgroundColor: myColor,
        title: const Text('Expense Tracker',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),),
        actions:[
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.add,color: Colors.white,size: 38,),
            color: Colors.deepPurple,),

          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout,color: Colors.white,),
            color: Colors.deepPurple,),
        ],

      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: myColor,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        unselectedFontSize: 16,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home,color: Colors.white,),
            label:'Home',
            backgroundColor: myColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.query_stats,color: Colors.white),
            label:'Stats',
            backgroundColor: myColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings,color: Colors.white),
            label:'Settings',
            backgroundColor: myColor,
          ),

        ],
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
