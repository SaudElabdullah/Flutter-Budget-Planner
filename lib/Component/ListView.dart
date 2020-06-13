import 'package:flutter/material.dart';
import 'package:budgetplanner/Component/ListTile.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:budgetplanner/Models/expensesData.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesData>(
      builder: (context, expensesData, child) {
        return ListView.separated(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(5),
          itemCount: expensesData.historyCount,
          itemBuilder: (BuildContext context, int index) {
            return ListTileWidget(
              history: expensesData.expenses[index],
              index: index,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      },
    );
  }
}
