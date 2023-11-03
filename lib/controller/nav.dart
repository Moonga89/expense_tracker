// Importing necessary packages and files.

import 'package:expense_tracker/view/screens/home_page.dart';
import 'package:expense_tracker/view/screens/settings_screen.dart';
import 'package:expense_tracker/view/screens/statistics_screen.dart';
import 'package:flutter/material.dart';


// Importing the ThemeNotifier class for theme management.


class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  // Variable to track the current page index.
  int currentPageIndex = 0;
  // Declare the universal color
  late Color myColor;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    return Scaffold(
      // Bottom Navigation Bar
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.purple,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 2),
          backgroundColor: Colors.purple,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.stacked_bar_chart_outlined),
              selectedIcon: Icon(Icons.stacked_bar_chart),
              label: 'Statistics ',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],

          // get index and store inside our state
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
        ),

      ),
      body: <Widget>[
        const HomePage(),   // Display Home screen at index 0.
        const StatsScreen(), // Display ChartApp screen at index 1.
        SettingsPage(), // Display Settings screen at index 2.
      ]
      [currentPageIndex],

    );
  }
}