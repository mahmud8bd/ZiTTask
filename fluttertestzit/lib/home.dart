import 'package:flutter/material.dart';
import 'package:fluttertestzit/component/constants.dart';
import 'package:fluttertestzit/component/rounded_button.dart';
import 'package:fluttertestzit/component/rounded_input_field.dart';
import 'package:fluttertestzit/screen/login.dart';
import 'package:fluttertestzit/screen/registration.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        color: Colors.white24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(fontSize: sWelcomeFontSize),
            ),
            SizedBox(
              height: 10,
            ),
            RoundedButton(
                text: "Registration",
                presses: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Registration(),));
                },
                color: sPrimaryColor,
                textColor: sPrimaryLightColor),
            SizedBox(
              height: 10,
            ),
            RoundedButton(
                text: "Login",
                presses: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                },
                color: sPrimaryLightColor,
                textColor: sPrimaryColor)
          ],
        ),
      ),
    );
  }
}
