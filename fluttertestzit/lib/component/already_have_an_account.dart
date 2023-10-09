import 'package:flutter/material.dart';
import 'package:fluttertestzit/component/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function() press;

  const AlreadyHaveAnAccountCheck({
    super.key,
    required this.login,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ?" : "Already have an Account ?",
          style: TextStyle(color: sPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(color: sPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
