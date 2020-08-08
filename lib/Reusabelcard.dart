import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color c;
  final Widget cardChild;
  final Function onPress;
  ReuseableCard({@required this.c, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
