import 'package:flutter/material.dart';

import 'package:amazon_clone/app/resources/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.textFieldBorderCorlor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.textFieldBorderCorlor,
          ),
        ),
      ),
      //textFormField ha validator
      validator: (value) {
        return null;
      },
    );
  }
}
