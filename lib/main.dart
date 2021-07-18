import 'package:budgetplanner/services/Expenses_Data.dart';
import 'package:flutter/material.dart';
import 'package:budgetplanner/Screens/MainScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpensesData.db,
      child: MaterialApp(
        title: 'Budget Planner',
        home: MainScreen(),
      ),
    );
  }
}