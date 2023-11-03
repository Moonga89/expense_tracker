import 'package:hive/hive.dart';
import '../../model/expense_item.dart';

class HiveDataBase {
  //reference the box we created in our main function
  final _mybox = Hive.box('expense_database');

  // write data
  void saveData(List<ExpenseItem> allExpense) {
    /*

    Hive can only store strings and dateTime, and not custom objects like expenseItem.
    so we convert ExpenseItem objects into types that can be stored in our db

    allExpense =

    [

      ExpenseItem ( name / amount / dateTime )
      ..

    ]

    ->

    [

    [ name, amount, dateTime ],
    ..

    ]

     */

    List<dynamic> allExpensesFormatted = [];
    // for loop goes through each expense
    for (var expense in allExpense) {

      //convert each expenseItem into a list of storable types (strings, dateTime)
      List<dynamic> expenseFormatted = [

        // get expenseItems
        expense.name,
        expense.amount,
        expense.dateTime,
      ];

      // add to overall list allExpenseFormatted
      allExpensesFormatted.add(expenseFormatted);

      // finally store out list in our database
      _mybox.put('All_EXPENSES', allExpensesFormatted);
      print(_mybox.get('All_EXPENSES'));
    }
  }

  // read data
  List<ExpenseItem> readData() {
    /*

      Data is stored in Hive as string + dateTime
      So lets convert our saved data into ExpenseItem objects

      saveData =

      [
        create expenseItem
      [ name, amount, dateTime],
      ..

      ]

      ->

      [

      ExpenseItem ( name / amount / dateTime )
      ..

      ]

     */

    List savedExpenses = _mybox.get('ALL_EXPENSES') ?? [];// if no info was saved in the box we could get a null
    List<ExpenseItem> allExpense = [];// return empty list

    for (int i = 0; i < savedExpenses.length; i++) {//i being a particular list and 0,1,2 being the values
      // collect the individual expense data
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      String dateTime = savedExpenses[i][2];

      // create expense item
      ExpenseItem expense = ExpenseItem(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );

      // add expense to overall list of expenses
      allExpense.add(expense);
    }
    return allExpense;
  }
}