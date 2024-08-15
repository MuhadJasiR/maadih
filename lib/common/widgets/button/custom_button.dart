import 'package:flutter/material.dart';
import 'package:madh/core/colors/const_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});

  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          minimumSize: Size(size.width * 3, 50)),
      child: Text(
        title,
        style: const TextStyle(color: kWhiteColor),
      ),
    );
  }
}
