import 'package:flutter/material.dart';
import 'package:budgetplanner/Component/ListTile.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:budgetplanner/Models/Expenses.dart';

class ListViewWidget extends StatelessWidget {
  List expenses;

  ListViewWidget({@required expenses});

  @override
  Widget build(BuildContext context) {
    return Consumer<Expenses>(
      builder: (context, expensesData, child) {
        return ListView.separated(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(5),
          itemCount: expenses.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTileWidget(
              history: expenses.elementAt(index),
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
