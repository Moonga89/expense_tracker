import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/data/expense_data.dart';
import '../../controller/dateTime/date_time_helper.dart';
import '../../graphs/bar_graph.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;// create parameter for start of the week

  const ExpenseSummary({
    super.key,
    required this.startOfWeek,

  });
  // calculate max amount in bar graph so that the cap is never quite full.
  double calculateMax(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday,
      ) {

       double? max = 100;

       List<double> values = [
       value.calculateDailyExpenseSummary()[sunday] ?? 0,
       value.calculateDailyExpenseSummary()[monday] ?? 0,
       value.calculateDailyExpenseSummary()[tuesday] ?? 0,
       value.calculateDailyExpenseSummary()[wednesday] ?? 0,
       value.calculateDailyExpenseSummary()[thursday] ?? 0,
       value.calculateDailyExpenseSummary()[friday] ?? 0,
       value.calculateDailyExpenseSummary()[saturday] ?? 0,
       ];

       // sort it from the smallest to the largest
      values.sort();
       // get largest amount (which is at the end of the sorted list)
      // and increase that slightly so that it almost looks full
      max = values.last * 1.1;

      // after check if it's zero lets make it 100
      // otherwise lets give it a new cap
      return max == 0 ? 100 : max;
  }

  // calculate the week total
  String calcualeWeekTotal(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday,
      ){

      List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];
      // add up all these values together
    double total = 0;
    for( int i = 0; i< values.length; i++){
      total += values[i];
    }

    return total.toStringAsFixed(2);
  }


  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday = convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday = convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday = convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thursday = convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String friday = convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday = convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));
      return Column(
        // week total
        children: [
          const SizedBox(height: 50,),
          const Padding(
            padding:  EdgeInsets.all(25.0),
            child: Row(
              children: [
                Text('Week Total: ', style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text('\$')
              ],
            ),
          ),
          Consumer<ExpenseData>(
            builder: (context, value, child) => SizedBox(
                height: 350,
                child: MyBarGraph(
                  maxY: calculateMax(value, sunday, monday, tuesday, wednesday,
                      thursday, friday, saturday),
                  sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
                  monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
                  tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
                  wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
                  thurAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
                  friAmount: value.calculateDailyExpenseSummary()[friday] ?? 0,
                  satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,
                ),
              ),
          ),
        ],
      );

  }
}