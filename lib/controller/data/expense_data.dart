import 'package:expense_tracker/controller/dateTime/date_time_helper.dart';
import 'package:expense_tracker/model/expense_item.dart';

class ExpenseData {

  //list of all expenses
  List<ExpenseItem> overallExpenseList = [];
  //get Expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }
  //add new expense.
  void addNewExpense (ExpenseItem newExpense){
    overallExpenseList.add(newExpense);//adding new expense to the overall expense list.
  }

  //delete expense
  void deleteExpense (ExpenseItem expense){
    overallExpenseList.remove(expense);//deleting expense from the overall list
  }

  //get weekday (mon, tue, wed,) etc from the datetime object
  String getDayName(DateTime dateTime){
    switch(dateTime.weekday){
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  //get date from start of the week (Sunday)
  DateTime startOfWeekDate(){
    DateTime? startOfWeek;

    //get today's date
    DateTime today = DateTime.now();

    //go backwards from today to find Sunday
    for(int i = 0; i < 7; i++){
      if(getDayName(today.subtract(Duration(days: i))) == 'Sun'){
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  /*

  convert overall list of expenses into daily summery

  e.g.

  overallExpenseList =

  [

  [ food, 03/02/2023, K15 ]
  [ clothes, 03/02/2023, K15 ]
  [ hat, 03/02/2023, K15 ]
  [ car, 03/02/2023, K15 ]
  [ rent, 03/02/2023, K15 ]

  ]

  ->

  dailyExpenseSummery =

  [

  [2023/01/30: K14]
  [2023/01/31: K14]
  [2023/02/01: K14]
  [2023/02/02: K14]
  [2023/02/03: K14]


  ]

  */
// will come in handy when displaying our statistic
  Map<String, double> calculateDailyExpenseSummery(){
    Map<String, double> dailyExpenseSummery = {
      //date (yyyymmdd): amountTotalForDay
    };

    for(var expense in overallExpenseList){
      String date = convertDateTimeToString(expense.date);
      double amount = double.parse(expense.amount);

      if(dailyExpenseSummery.containsKey(date)){
        double currentAmount = dailyExpenseSummery[date]!;
        currentAmount += amount;
        dailyExpenseSummery[date] = currentAmount;

      }else {
        dailyExpenseSummery.addAll({date: amount});
      }
    }
    return dailyExpenseSummery;
  }


}
