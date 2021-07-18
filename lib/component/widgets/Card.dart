import 'package:flutter/material.dart';
import 'package:budgetplanner/Component/Widgets/TextWidget.dart';
import 'package:budgetplanner/Component/Constants/Constants.dart';
import 'package:budgetplanner/utilities/SizeConfig.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    @required this.amount,
    @required this.iconKind,
    @required this.kind,
  });

  final String amount;
  final String kind;
  final IconData iconKind;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Card(
      elevation: 15,
      color: Constants.shadeOfMainColor,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    iconKind,
                    color: Constants.mainColor,
                    size: SizeConfig.screenWidth * 6,
                  ),
                  backgroundColor: Constants.secondaryColor,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * 2,
                ),
                TextWidget(
                  text: kind,
                  size: SizeConfig.screenWidth * 7,
                ),
              ],
            ),
            TextWidget(
              text: '$amount SR',
              size: SizeConfig.screenWidth * 7,
            ),
          ],
        ),
      ),
    );
  }
}
