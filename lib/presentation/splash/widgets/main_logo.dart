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
          radius: 25,
          backgroundColor: kWhiteColor,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.snowing,
              color: kWhiteColor,
              size: 35,
            ),
          ),
        ),
        kWidth(10),
        Text(
          "Maadih",
          style: GoogleFonts.dynalight(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
          ),
        )
      ],
    );
  }
}
