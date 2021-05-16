import 'package:BMI/Widgets/BottomButton.dart';
import 'package:BMI/Components/Constants.dart';
import 'package:BMI/Widgets/ReusableCard.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    @required this.calcBMI,
    @required this.bmiResult,
    @required this.bmiInterpretation,
  });

  final String calcBMI;
  final String bmiResult;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          backgroundColor: Color(0xFF328f41),
        ),
        body: MediaQuery(
          data: MediaQueryData(textScaleFactor: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: ReusableCard(
                  rcCardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiResult,
                        style: kResultTextStyle,
                      ),
                      Text(
                        calcBMI,
                        style: kBMIResultTextStyle,
                      ),
                      Text(
                        bmiInterpretation,
                        style: kInterpretationStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  colour: kActiveCardColor,
                ),
              ),
              BottomButton(
                buttonText: 'CALCULATE AGAIN',
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
