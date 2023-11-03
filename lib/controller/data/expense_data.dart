import 'package:flutter/widgets.dart';
import '../../model/expense_item.dart';
import '../dateTime/date_time_helper.dart';
import 'hive_database.dart';

class ExpenseData extends ChangeNotifier {
  // list of all expenses
  List<ExpenseItem> overallExpenseList = [];

  // get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  // prepare data to display that already exists when user opens app
  final db = HiveDataBase();// create database object
  void prepareData() {
    // if the data exists, get it
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }
  }

  // Function responsible for adding a new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);

    notifyListeners();
    db.saveData(overallExpenseList);// save data
  }

  // Function responsible for deleting an expense
  void deleteExpense(ExpenseItem deleteExpense) {
    overallExpenseList.remove(deleteExpense);

    notifyListeners();
    db.saveData(overallExpenseList);// save data
  }

  // get weekday (mon, tue, wed, etc) from a dateTime object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
  // get the date for the start of the week ( sunday )
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

  // get today's date
    DateTime today = DateTime.now();

  //  go back wards from today to find sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sunday') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }

    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime as DateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }

    return dailyExpenseSummary;
  }
}