import 'package:BMI/Components/Constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPress, @required this.buttonText});

  final String buttonText;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: Color(0xFF328f41),
        // margin: EdgeInsets.all(10),
        padding: EdgeInsetsDirectional.only(bottom: 10.0, top: 5.0),
        height: 65.0,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonText,
            style: kBottomButtonTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
