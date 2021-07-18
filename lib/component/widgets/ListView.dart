import 'package:flutter/material.dart';
import 'package:budgetplanner/Component/Widgets/ListTile.dart';
import 'package:budgetplanner/entities/Expenses.dart';
import 'package:flutter/widgets.dart';

class ListViewWidget extends StatelessWidget {
  final expenses = null;
  final  expensesLength = 1;

  ListViewWidget({@required expenses});

  isNull(bool answer) {
    if (answer) {
      expenses.add(new Expenses(
          expenses: "null", type: "null", date: "null", amount: "null"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      itemCount: (expenses.length == null) ? expenses.length : isNull(true),
      itemBuilder: (BuildContext context, int index) {
        return ListTileWidget(
          history: expenses.elementAt(index),
          index: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
