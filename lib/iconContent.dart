import 'package:flutter/material.dart';
import 'constants.dart';

class iconContent extends StatelessWidget {
  final IconData myIcon;
  final String myText;
  iconContent({this.myIcon, this.myText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          myText,
          style: kMyTextStyle,
        )
      ],
    );
  }
}
