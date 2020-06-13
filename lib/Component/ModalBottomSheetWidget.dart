import 'package:flutter/material.dart';
import 'package:budgetplanner/Component/Constants.dart';
import 'package:budgetplanner/Component/TextWidget.dart';
import 'package:budgetplanner/Component/DropdownButtonWidget.dart';
import 'package:budgetplanner/Models/expensesData.dart';
import 'package:budgetplanner/Models/SizeConfig.dart';
import 'package:provider/provider.dart';

class ModalSheetWidget extends StatefulWidget {
  @override
  _ModalSheetWidgetState createState() => _ModalSheetWidgetState();
}

class _ModalSheetWidgetState extends State<ModalSheetWidget> {
  Color iconColorOne = Constants.secondaryColor;
  Color iconColorTwo = Constants.secondaryColor;
  String amount;
  String expense;
  String date;
  String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.mainColor,
      child: Container(
        padding: EdgeInsets.all(20.0),
        color: Constants.mainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextWidget(
              text: 'Expense Type',
              size: SizeConfig.screenWidth * 7,
              color: Constants.secondaryColor,
              textAlign: TextAlign.center,
            ),
            DropdownButtonWidget(
              expenseType: (String transExpense) {
                setState(() {
                  expense = transExpense;
                });
              },
            ),
            SizedBox(
              height: SizeConfig.screenWidth * 3,
            ),
            TextWidget(
              text: 'Amount',
              size: SizeConfig.screenWidth * 7,
              color: Constants.secondaryColor,
              textAlign: TextAlign.center,
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Constants.secondaryColor,
              style: TextStyle(
                color: Constants.secondaryColor,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.secondaryColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.secondaryColor,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.secondaryColor,
                  ),
                ),
              ),
              onChanged: (newText) {
                amount = newText;
              },
            ),
            SizedBox(
              height: SizeConfig.screenWidth * 3,
            ),
            TextWidget(
              text: 'Kind',
              size: SizeConfig.screenWidth * 7,
              color: Constants.secondaryColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenWidth * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      iconColorOne = Constants.shadeOfSecondaryColor;
                      iconColorTwo = Constants.secondaryColor;
                      type = 'spent';
                    });
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Constants.spentIcon,
                      color: Constants.mainColor,
                    ),
                    backgroundColor: iconColorOne,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * 3,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      iconColorTwo = Constants.shadeOfSecondaryColor;
                      iconColorOne = Constants.secondaryColor;
                      type = 'income';
                    });
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Constants.incomeIcon,
                      color: Constants.mainColor,
                    ),
                    backgroundColor: iconColorTwo,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenWidth * 3,
            ),
            FlatButton(
              child: TextWidget(
                text: 'Add Expense',
                size: SizeConfig.screenWidth * 7,
              ),
              color: Constants.shadeOfSecondaryColor,
              onPressed: () {
                if (amount != null && type != null && expense != null) {
                  date = DateTime.now().month.toString() +
                      '/' +
                      DateTime.now().day.toString();
                  if (type == 'spent') {
                    Provider.of<ExpensesData>(context)
                        .changeTotalSpent(double.parse(amount));
                  } else {
                    Provider.of<ExpensesData>(context)
                        .changeTotalIncome(double.parse(amount));
                  }
                  Provider.of<ExpensesData>(context)
                      .addExpense(type, amount, expense, date);
                  amount = null;
                  type = null;
                  Navigator.pop(context);
                }
              },
            ),
            SizedBox(
              height: SizeConfig.screenWidth * 10,
            ),
          ],
        ),
      ),
    );
  }
}
