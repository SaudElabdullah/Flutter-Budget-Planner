import 'package:flutter/material.dart';
import 'package:budgetplanner/Models/SizeConfig.dart';
import 'package:budgetplanner/Component/Constants.dart';

class DropdownButtonWidget extends StatefulWidget {
  final Function expenseType;
  DropdownButtonWidget({this.expenseType});
  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String selectedCategory = Constants.categories[0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Constants.mainColor,
        ),
        child: DropdownButton<String>(
          value: selectedCategory,
          elevation: 16,
          style: TextStyle(
            color: Constants.secondaryColor,
            fontSize: SizeConfig.screenWidth * 6,
            fontFamily: 'PlayfairDisplay',
          ),
          underline: Container(
            height: 2,
            color: Constants.shadeOfMainColor,
          ),
          onChanged: (String newValue) {
            setState(() {
              selectedCategory = newValue;
            });
            widget.expenseType(selectedCategory);
          },
          items: Constants.categories
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
