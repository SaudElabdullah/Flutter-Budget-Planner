import 'dart:convert';

import 'package:flutter/foundation.dart';

class Expenses {
  String amount;
  String expenses;
  String date;
  String type;

  Expenses(
      {@required this.type,
      @required this.amount,
      @required this.expenses,
      @required this.date});

  Expenses clientFromJson(String str) {
    final jsonData = json.decode(str);
    return Expenses.fromMap(jsonData);
  }

  String clientToJson(Expenses data) {
    final dyn = data.toMap();
    return json.encode(dyn);
  }

  factory Expenses.fromMap(Map<String, dynamic> json) => new Expenses(
        amount: json['amount'],
        expenses: json['expenses'],
        date: json['date'],
        type: json['type'],
      );

  Map<String, dynamic> toMap() => {
        'amount': amount,
        'expenses': expenses,
        'date': date,
        'type': type,
      };
}
