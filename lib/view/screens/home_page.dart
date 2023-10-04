import 'package:expense_tracker/view/components/add_expense_button.dart';
import 'package:expense_tracker/view/screens/expense_entry_form.dart';
import 'package:expense_tracker/view/screens/expense_list.dart';
import 'package:expense_tracker/view/screens/settings_screen.dart';
import 'package:expense_tracker/view/screens/statistics_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {

  const HomePage({
     super.key,

   });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //declare universal colour
  late Color myColor;

  //declare current index
  int _currentIndex = 0;

  //declare longitude and latitude values
  late String lat;
  late String long;

  //function for switching screens
  void switchScreens(index){
    setState(() {
      _currentIndex = index;
    });
  }
  final List _screens = [
    //home screen
    const HomePage(),
    //statistics screen
    const StatsScreen(),
    //settings screen
    const SettingsScreen(),
  ];

  void signOut(){
    FirebaseAuth.instance.signOut();
  }


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
        const Icon(Icons.add,size: 43,color: Colors.white,),
        IconButton(
          onPressed: signOut,
          icon: const Icon(Icons.logout,color: Colors.white,),
          color: Colors.deepPurple,),

      ],
      ),
      body: ListView(
        children:  [
          Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              height: 50,
              color: Colors.white,
            ),
        ),
        const SizedBox(height: 20,),
        AddExpenseButton(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ExpenseEntryForm()));
            },
            text: 'Expense',

        ),
        const SizedBox(height: 20,),
        const ExpenseList(),
        const ExpenseList(),

      _screens[_currentIndex],
        ],
      ),
      bottomNavigationBar: Container(
        color: myColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
                vertical: 15),
          child: GNav( // custom Bottom Navigation bar from google_nav_bar package
              onTabChange:(index){},
              gap: 8,
              backgroundColor: myColor,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.all(16),
              tabs:const [
              GButton(
                  icon: LineIcons.home,
                  text: 'Home',
              ),
              GButton(
                  icon: Icons.query_stats_rounded,
                  text: 'Stats',
              ),
              GButton(
                  icon: Icons.settings,
                  text: 'Settings',
              ),

          ],

          ),
        ),
      ),
    );
  }
}
