import 'package:expense_tracker/model/app_settings.dart';
//import 'package:expense_tracker/view/themes/theme_provider.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettingsModel>(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 20),
        children: [
          const SizedBox(height: 100,),
          const Text('Settings',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30,),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: appSettings.isDarkMode,
            onChanged: (newValue) {
              appSettings.toggleDarkMode(newValue);
            },
          ),
          const SizedBox(height: 15,),
          ListTile(
            title: const Text('Currency'),
            trailing: DropdownButton<String>(
              value: appSettings.currency,
              items: ['USD', 'EUR', 'GBP', 'JPY', 'ZMW']
                  .map((currency) => DropdownMenuItem<String>(
                value: currency,
                child: Text(currency),
              ))
                  .toList(),
              onChanged: (newCurrency) {
                appSettings.changeCurrency(newCurrency!);
              },
            ),
          ),
          const SizedBox(height: 15,),
          ListTile(
            title: const Text('Date Format'),
            trailing: DropdownButton<String>(
              value: appSettings.dateFormat,
              items: ['MM/dd/yyyy', 'dd/MM/yyyy', 'yyyy-MM-dd', 'MM-dd-yyyy']
                  .map((format) => DropdownMenuItem<String>(
                value: format,
                child: Text(format),
              ))
                  .toList(),
              onChanged: (newFormat) {
                appSettings.changeDateFormat(newFormat!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
