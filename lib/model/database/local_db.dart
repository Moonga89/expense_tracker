import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

Database? _database;
//create database class
class LocalDatabase{
  Future get database async{
    if(_database != null) return _database;
    _database = await _initializeDB('local.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  //Now we create the _createDB and get the data and version
  Future _createDB(Database db, int version) async {
    await db.execute(
      //Here we can run QUERIES in between the triple opening inverted commas and closing commas
'''
CREATE TABLE localExpense (
             Id INTEGER PRIMARY KEY,
             Name TEXT NOT NULL,
             Date TEXT NOT NULL
             Category TEXT NOT NULL
           )
'''

    );
  }

  Future addExpenseLocally() async {
    final db= await database;
    await db.insert("localExpense");//add insert query for adding the records in the fields
    return 'added';
  }

}