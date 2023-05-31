import 'package:amazon_clone/app/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          foregroundColor: ColorManager.backgroundColor,
          backgroundColor: ColorManager.secondaryColor,
          minimumSize: const Size(double.infinity, 50)),
      child: Text(
        text,
      ),
    );
  }
}
