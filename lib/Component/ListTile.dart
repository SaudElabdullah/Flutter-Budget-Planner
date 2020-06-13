import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:budgetplanner/Component/TextWidget.dart';
import 'package:budgetplanner/Component/Constants.dart';
import 'package:budgetplanner/Models/Expenses.dart';
import 'package:budgetplanner/Models/SizeConfig.dart';

class ListTileWidget extends StatelessWidget {

  ListTileWidget(
      {@required this.history,
        @required this.index});

  final Expenses history;
  final int index;
  IconData kind() {
    if (history.type == 'income') {
      return Constants.incomeIcon;
    } else {
      return Constants.spentIcon;
    }
  }

  TextWidget textWidgetChooser() {
    if (history.type == 'spent') {
      return TextWidget(
        text: '-' + history.amount.toString() + 'SR',
        size: SizeConfig.screenWidth * 5,
        color: Colors.red,
      );
    } else {
      return TextWidget(
        text: '+' + history.amount.toString() + 'SR',
        size: SizeConfig.screenWidth * 5,
        color: Colors.green,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextWidget(
        text: history.expenses,
        color: Constants.secondaryColor,
        size: SizeConfig.screenWidth * 7,
      ),
      subtitle: TextWidget(
        text: history.date,
        color: Constants.shadeOfSecondaryColor,
        size: SizeConfig.screenWidth * 5,
      ),
      trailing: textWidgetChooser(),
      leading: GFAvatar(
        child: Icon(
          kind(),
          color: Colors.white,
        ),
        shape: GFAvatarShape.standard,
        backgroundColor: Constants.shadeOfMainColor,
      ),
    );
  }
}
