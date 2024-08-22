import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madh/core/size/const_size.dart';

import '../../../core/colors/const_colors.dart';

class MaadihLogo extends StatelessWidget {
  const MaadihLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/logo/maadih_logo.jpg"),
          radius: 30,
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.mosque_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
        kWidth(10),
        Text(
          "Maadih",
          style: GoogleFonts.anton(
            fontSize: 40,
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
