import 'package:BMI/Components/BMICalculator.dart';
import 'package:BMI/Components/Constants.dart';
import 'package:BMI/Widgets/RoundIconButton.dart';
import 'package:BMI/Screens/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:BMI/Widgets/IconContent.dart';
import 'package:BMI/Widgets/ReusableCard.dart';
import 'package:BMI/Widgets/BottomButton.dart';

enum Gender {
  male,
  female,
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 65;
  int age = 20;

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        rcCardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        rcCardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        rcCardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'HEIGHT',
                              style: kLabelStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumberStyle,
                                ),
                                Text(
                                  ' cm',
                                  style: kLabelStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFF328f41),
                                overlayColor: Color(0x29328f41),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                              ),
                              child: Slider(
                                  value: height.toDouble(),
                                  min: 120,
                                  max: 220,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      height = newValue.round();
                                    });
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        rcCardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (weight <= 10) {
                                        weight = 10;
                                      } else {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      if (weight >= 200) {
                                        weight = 200;
                                      } else {
                                        weight++;
                                      }
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        rcCardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (age <= 10) {
                                        age = 10;
                                      } else {
                                        age--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      if (age >= 80) {
                                        age = 80;
                                      } else {
                                        age++;
                                      }
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                buttonText: 'CALCULATE',
                onPress: () {
                  CalculateBMI calc =
                      CalculateBMI(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                          calcBMI: calc.calculateBMI(),
                          bmiResult: calc.getResult(),
                          bmiInterpretation: calc.getInterpretation()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
