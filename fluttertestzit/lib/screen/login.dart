import 'package:flutter/material.dart';
import 'package:fluttertestzit/component/constants.dart';
import 'package:fluttertestzit/component/rounded_button.dart';
import 'package:fluttertestzit/component/rounded_input_field.dart';
import 'package:fluttertestzit/component/rounded_password_field.dart';
import 'package:fluttertestzit/model/user.dart';
import 'package:fluttertestzit/screen/food_view.dart';
import 'package:fluttertestzit/service/api_service.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ApiService _apiService = ApiService();
  User? user;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  userLogin(){
    user = User(
        userId: 1,
        userName: "userName",
        userEmail: _email.text.toString(),
        userPhone: "userPhone",
        userPassword: _password.text.toString()
    );
    _apiService.userLogin(user!);
  }
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
              "Login",
              style: TextStyle(fontSize: sWelcomeFontSize),
            ),
            SizedBox(
              height: 10,
            ),
            RoundedInputField(hintText: "Email", icon: Icons.email, onChanged: (value){}, controller: _email),
            RoundedPasswordField(onChanged: (value){}, controller: _password),
            RoundedButton(
                text: "Login",
                presses: () {
                  userLogin();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FoodView(),));
                },

                color: sPrimaryColor,
                textColor: sPrimaryLightColor),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
