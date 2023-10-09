import 'package:flutter/material.dart';
import 'package:fluttertestzit/component/constants.dart';
import 'package:fluttertestzit/component/rounded_button.dart';
import 'package:fluttertestzit/component/rounded_input_field.dart';
import 'package:fluttertestzit/component/rounded_password_field.dart';
import 'package:fluttertestzit/model/user.dart';
import 'package:fluttertestzit/screen/login.dart';
import 'package:fluttertestzit/service/api_service.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  ApiService _apiService = ApiService();
  User? user;
  TextEditingController _id = TextEditingController(text: '1');
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  addUsers(){
    user = User(
        userId: int.parse(_id.text.toString()),
        userName: _name.text.toString(),
        userEmail: _email.text.toString(),
        userPhone: _phone.text.toString(),
        userPassword: _password.text.toString()
    );
    _apiService.addUser(user!);
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        color: Colors.white24,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Registration",
                style: TextStyle(fontSize: sWelcomeFontSize),
              ),
              SizedBox(
                height: 10,
              ),
              RoundedInputField(
                  hintText: "Name",
                  icon: Icons.person,
                  onChanged: (value) {},
                  controller: _name),
              RoundedInputField(
                  hintText: "Email",
                  icon: Icons.email,
                  onChanged: (value) {},
                  controller: _email),
              RoundedInputField(
                  hintText: "Phone",
                  icon: Icons.phone,
                  onChanged: (value) {},
                  controller: _phone),
              RoundedPasswordField(
                  onChanged: (value) {}, controller: _password),
              RoundedButton(
                  text: "Submit",
                  presses: () {
                    addUsers();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  },
                  color: sPrimaryColor,
                  textColor: sPrimaryLightColor),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
