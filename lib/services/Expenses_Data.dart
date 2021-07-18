import 'dart:io';
import 'package:budgetplanner/entities/Expenses.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class ExpensesData extends ChangeNotifier {
  ExpensesData._();
  static final ExpensesData db = ExpensesData._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }


  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Expense ("
          "id INTEGER AUTOINCREMENT PRIMARY KEY,"
          "amount TEXT,"
          "expenses TEXT,"
          "date TEXT,"
          "type TEXT,"
          ")");
    });
  }

  newExpenses(Expenses newExpenses) async {
    final db = await database;
    await db.insert("Expenses", newExpenses.toMap());
    notifyListeners();
  }

  getAllExpenses() async {
    final db = await database;
    var res = await db.query("Expenses");
    List<Expenses> list = res.map((c) => Expenses.fromMap(c)).toList();
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    db.delete("Expenses", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Expenses");
  }

  currentBalance() async {
    final db = await database;
    var res = await db.execute("SELECT SUM(amount) as amount FROM Expenses");
    return res;
  }

  totalIncome() async {
    final db = await database;
    var res = await db.execute("SELECT SUM(amount) as amount WHERE type = 'Income' FROM Expenses");
    return res;
  }

  totalSpent() async {
    final db = await database;
    var res = await db.execute("SELECT SUM(amount) as amount WHERE type = 'Spent   ' FROM Expenses");
    return res;
  }

  length() async {
    final db = await database;
    var res = await db.execute("SELECT COUNT(amount) as amount WHERE FROM Expenses");
    return res;
  }
}
