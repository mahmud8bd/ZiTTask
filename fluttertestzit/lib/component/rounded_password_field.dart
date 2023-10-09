import 'package:flutter/material.dart';
import 'package:fluttertestzit/component/constants.dart';
import 'package:fluttertestzit/component/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
      controller: controller,
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: sPrimaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: sPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
