//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:expense_tracker/controller/data/expense_data.dart';
import 'package:expense_tracker/controller/data/expense_data.dart';
import 'package:expense_tracker/model/app_settings.dart';
import 'package:expense_tracker/model/database/authentication_page.dart';
import 'package:expense_tracker/model/database/firebase_options.dart';
//import 'package:expense_tracker/view/screens/home_page.dart';
//import 'package:expense_tracker/view/themes/dark_theme.dart';
import 'package:expense_tracker/view/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main()async{
  // make sure our widget is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // initialize hive
  await Hive.initFlutter();
  // open a hive box
  await Hive.openBox("expense_database");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // We define that the data should be stored in our sharedPreferences
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MultiProvider(

    providers: [
      ChangeNotifierProvider<ExpenseData>(create: (_) => ExpenseData()),
      ChangeNotifierProvider(
        create: (context)=> ThemeProvider(),

      ),
    ],
    child: const MyApp(),
  )
  );
}
class MyApp extends StatelessWidget {

  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> AppSettingsModel(),
      builder: (context, child)=> MaterialApp(
    title: 'Your App Name',
    theme: ThemeData(
    primarySwatch: Colors.grey,
    brightness:
    Provider.of<AppSettingsModel>(context).isDarkMode
    ? Brightness.dark
        : Brightness.light,


      ),
    home: AuthenticationPage(onTap: () {  },),
    ),
    );
  }
}
