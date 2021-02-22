import 'package:budgetplanner/Models/expensesData.dart';
import 'package:flutter/material.dart';
import 'package:budgetplanner/Screens/MainScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Planner',
      theme: ThemeData(
        fontFamily: 'PlayfairDisplay',
      ),
      home: Main_Screen(),
    );
  }
}
