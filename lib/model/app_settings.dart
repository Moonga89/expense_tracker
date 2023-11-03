import 'package:flutter/foundation.dart';

class AppSettingsModel extends ChangeNotifier {
// Declaring the variables
  bool isDarkMode = false;
  String currency = 'USD';
  String dateFormat = 'MM/dd/yyyy';

// This function manages the switch between dark and light mode
  void toggleDarkMode(bool newValue) {
    isDarkMode = newValue;
    notifyListeners();
  }
// This function manages the currency change when the user clicks the dropdown
  void changeCurrency(String newCurrency) {
    currency = newCurrency;
    notifyListeners();
  }
// This function manages changing of the date format
  void changeDateFormat(String newFormat) {
    dateFormat = newFormat;
    notifyListeners();
  }

}
