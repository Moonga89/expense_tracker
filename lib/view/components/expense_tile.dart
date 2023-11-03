import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTapped;

  ExpenseTile({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    // delete button
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(width: 5,),
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListTile(
          tileColor: Theme.of(context).colorScheme.background,
          title: Text(name),
          subtitle: Text('${dateTime.day}/${dateTime.month}/${dateTime.year}'),
          trailing: Text('$amount ZMW'),
        ),
      ),
    );
  }
}