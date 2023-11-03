import 'package:expense_tracker/controller/data/expense_data.dart';
import 'package:expense_tracker/view/components/expense_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  late Color myColor;
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    return Consumer<ExpenseData>(
        builder: (context, value, child)=> Scaffold(
      body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const SizedBox(height: 100,),
            const Text('Statistics',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            // Weekly summary
            ExpenseSummary(startOfWeek: value.startOfWeekDate(),),


          ]
      ),
    ));
  }
}
