import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusabelcard.dart';
import 'package:bmi_calculator/iconContent.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'bmi_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 32;
  int age = 22;

  /* we used ternary operator instead of if elseblock */
//  Color maleCardColor = inactiveColor;
//  Color femaleCardColor = inactiveColor;

//  void updateColor(Gender selectedGender) {
//    if (selectedGender == Gender.male) {
//      if (maleCardColor == inactiveColor) {
//        maleCardColor = activeColor;
//        femaleCardColor = inactiveColor;
//      } else {
//        maleCardColor = inactiveColor;
//      }
//    }
//    if (selectedGender == Gender.female) {
//      if (femaleCardColor == inactiveColor) {
//        maleCardColor = inactiveColor;
//        femaleCardColor = activeColor;
//      } else {
//        femaleCardColor = inactiveColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      c: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: iconContent(
                        myIcon: FontAwesomeIcons.mars,
                        myText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      c: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: iconContent(
                        myIcon: FontAwesomeIcons.venus,
                        myText: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                c: kReuseableCard_color,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kMyTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kMyTextStyleBold,
                        ),
                        Text(
                          'cm',
                          style: kMyTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Color(0xfff90404),
                        inactiveTrackColor: Colors.deepPurpleAccent,
                        thumbColor: Colors.red,
                        overlayColor: Color(0x99ed4b4b),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 35),
                      ),
                      child: Slider(
                        value: height.toDouble(),
//                        activeColor: Colors.red,
//                        inactiveColor: Colors.deepPurpleAccent,
                        min: 120,
                        max: 250,
                        onChanged: (double newValue) {
                          setState(
                            () {
                              height = newValue.toInt();
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      c: kReuseableCard_color,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: kMyTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kMyTextStyleBold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      c: kReuseableCard_color,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: kMyTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kMyTextStyleBold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
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
                nameButton: 'Calculate',
                routePage: () {
                  BmiBrain calc = BmiBrain(height: height, weight: weight);

                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      bmiResult: calc.calculate(),
                      resultText: calc.getResult(),
                      inerpreation: calc.getIneterpretation(),
                    );
                  }));
                })
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  RoundIconButton({@required this.icon, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Colors.red,
    );
  }
}
