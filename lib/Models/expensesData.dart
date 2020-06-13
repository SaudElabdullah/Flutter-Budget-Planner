import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:budgetplanner/Models/Expenses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ExpensesData extends ChangeNotifier {
  List<Expenses> _history = [];
  double totalIncome = 0;
  double totalSpent = 0;
  double currentBalance = 0;

  Future setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getDouble('totalIncome') == null
        ? totalIncome = 0
        : totalIncome = prefs.getDouble('totalIncome');
    prefs.getDouble('totalSpent') == null
        ? totalSpent = 0
        : totalSpent = prefs.getDouble('totalSpent');
    prefs.getDouble('currentBalance') == null
        ? currentBalance = 0
        : currentBalance = prefs.getDouble('currentBalance');
    int index = 0;
    try {
      _history.clear();
      while (prefs.containsKey(index.toString())) {
        _history
            .add(Expenses.fromJson(json.decode(prefs.get(index.toString()))));
        index++;
      }
    } catch (e) {
      print(null);
    }
  }

  void changeTotalIncome(double change) async {
    final prefs = await SharedPreferences.getInstance();
    totalIncome = totalIncome + change;
    currentBalance = currentBalance + change;
    prefs.setDouble('totalIncome', totalIncome);
    prefs.setDouble('currentBalance', currentBalance);
  }

  void changeTotalSpent(double change) async {
    final prefs = await SharedPreferences.getInstance();
    totalSpent = totalSpent + change;
    currentBalance = currentBalance - change;
    prefs.setDouble('totalSpent', totalSpent);
    prefs.setDouble('currentBalance', currentBalance);
  }

  UnmodifiableListView<Expenses> get expenses {
    return UnmodifiableListView(_history);
  }

  int get historyCount {
    return _history.length;
  }

  Future<void> addExpense(
      String type, String amount, String expense, String date) async {
    final prefs = await SharedPreferences.getInstance();
    final Expenses newExpense = Expenses(
      type: type,
      amount: amount,
      expenses: expense,
      date: date,
    );
    prefs.setString(this.historyCount.toString(), json.encode(newExpense));
    _history.add(newExpense);
    notifyListeners();
  }

  void deleteEveryThing() async {
    final prefs = await SharedPreferences.getInstance();
    _history.clear();
    prefs.clear();
    notifyListeners();
  }
}
