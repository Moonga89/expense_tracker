
import 'package:expense_tracker/controller/data/expense_data.dart';
import 'package:expense_tracker/model/expense_item.dart';
import 'package:expense_tracker/view/components/add_expense_button.dart';
//import 'package:expense_tracker/view/components/add_expense_button.dart';
import 'package:expense_tracker/view/components/expense_tile.dart';
import 'package:expense_tracker/view/screens/settings_screen.dart';
import 'package:expense_tracker/view/screens/statistics_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
  final itemNameController = TextEditingController();
  final amountController = TextEditingController();
  final ngweController = TextEditingController();
  final dateController = TextEditingController();
  final categoryController = TextEditingController();

  //declare current index
  int _currentIndex = 0;

  //declare longitude and latitude values
  late String lat;
  late String long;
  final screens =  [
    //home screen
    const HomePage(),
    //statistics screen
    const StatsScreen(),
    //settings screen
    SettingsPage(),
  ];

  @override
  void initState(){
    super.initState();

    //prepare data on startup
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }


  void signOut(){
    FirebaseAuth.instance.signOut();
  }
  void save() {
    String amount =
        '${amountController.text}.${ngweController.text}';
    ExpenseItem newExpense = ExpenseItem(
      name: itemNameController.text,
      amount: amount,
      dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();// called to clear the text fields
  }
// When you click the add new expense button. This is the function that runs.
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: itemNameController,
              decoration: const InputDecoration(
                hintText: 'Name of Expense',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Kwacha',
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: ngweController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Ngwe',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,// this line calls the save function
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: cancel,// this line calls the cancel function
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
// This function is responsible for cancel action in the expense entry form.
  void cancel() {
    Navigator.pop(context);
    clear();// called to clear the text fields
  }
// This function is responsible for the clearing the fields once the save button has been pressed.
  void clear() {
    itemNameController.clear();
    amountController.clear();
    dateController.clear();
    categoryController.clear();
    ngweController.clear();
  }


  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    return Consumer<ExpenseData>(
        builder: (context, value, child)=> Scaffold(
          body: ListView(
            children:  [
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text('Expense Tracker',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              AddExpenseButton(
                onTap: addNewExpense,
                text: 'Add Expense'),
              const SizedBox(height: 15),
          ListView.separated(
            shrinkWrap: true,
            itemCount: value.getAllExpenseList().length,
            itemBuilder: (context, index) => ExpenseTile(
              name: value.getAllExpenseList()[index].name,
              amount: value.getAllExpenseList()[index].amount,
              dateTime: value.getAllExpenseList()[index].dateTime,
              deleteTapped: (BuildContext) {},
            ),separatorBuilder: (
              BuildContext context, int index)=> const Divider(
            color: Colors.white,
          ),

              /* const ExpenseList(),
          const ExpenseList(),*/

              //screens[_currentIndex],
      ),

            ],
          ),
        ),
    );
  }
}
