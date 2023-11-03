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
        children: [
          const SizedBox(height: 80,),
          Consumer<ExpenseData>(
            builder: (context, value, child) => SizedBox(
                height: 350,
                child: MyBarGraph(
                  maxY: 100,
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