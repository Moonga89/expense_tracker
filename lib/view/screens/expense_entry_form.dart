import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class ExpenseEntryForm extends StatefulWidget {
  final Function()? onTap;
  const ExpenseEntryForm({
    super.key,
    required this.onTap
  });

  @override
  State<ExpenseEntryForm> createState() => _ExpenseEntryFormState();
}

class _ExpenseEntryFormState extends State<ExpenseEntryForm> {
  final _formKey = GlobalKey<FormState>();
  late Color myColor;//creating a universal color for the app
  late Size mediaSize;// the app according to screen size

  //text editing controllers
  final itemNameController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final categoryController = TextEditingController();

  void signOut(){
    FirebaseAuth.instance.signOut();
  }
  //save info
  void save (){

  }
  //cancel form
  void cancel (){

  }
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title: const Text('Expense Tracker',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),),
        actions:[
          const Icon(Icons.add,size: 43,color: Colors.white,),
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout,color: Colors.white,),
            color: Colors.deepPurple,),

        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ListView(
              children: [
                TextFormField(
                  controller: itemNameController,
                  decoration: const InputDecoration(labelText: 'Name',
                      border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Enter Item into Textfield.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: amountController,
                  decoration: const InputDecoration(labelText: 'Amount',
                      border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Enter Item into Textfield.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(hintText: 'Date',
                      border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Enter Item into Textfield.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: categoryController,
                  decoration: const InputDecoration(hintText: 'Category',
                      border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Enter Item into Textfield.';
                    }
                    return null;
                  },
                ),
                MaterialButton(
                    onPressed: save,
                    child: const Text('Save'),
                ),
                MaterialButton(
                  onPressed: cancel,
                  child: const Text('Cancel'),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: myColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 15),
          child: GNav( // custom Bottom Navigation bar from google_nav_bar package
            onTabChange:(index){},
            gap: 8,
            backgroundColor: myColor,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepPurple,
            padding: const EdgeInsets.all(16),
            tabs:const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.query_stats_rounded,
                text: 'Stats',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),

            ],

          ),
        ),
      ),
    );
  }
}
