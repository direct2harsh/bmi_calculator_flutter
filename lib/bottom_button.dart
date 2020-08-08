import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String nameButton;
  Function routePage;
  BottomButton({@required this.nameButton, @required this.routePage});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: routePage,
      child: Container(
        child: Center(
            child: Text(
          nameButton,
          style: kMyBoldTextStyle,
        )),
        color: Colors.green,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        height: 55,
      ),
    );
  }
}
