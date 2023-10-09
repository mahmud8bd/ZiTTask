
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() presses;
  final Color color, textColor;

  const RoundedButton({
    super.key,
    required this.text,
    required this.presses,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: MaterialButton(
          onPressed: presses,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
