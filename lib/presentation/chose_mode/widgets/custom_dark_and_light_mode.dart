import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madh/core/colors/const_colors.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/chose_mode/bloc/theme_cubit.dart';

class CustomDarkAndLightModeTheme extends StatelessWidget {
  const CustomDarkAndLightModeTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: kWhiteColor.withOpacity(0.3),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                  },
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                    color: kWhiteColor,
                  )),
            ),
            kHeight(5),
            const Text(
              "Dark Mode",
              style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: kWhiteColor.withOpacity(0.3),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                  },
                  icon: const Icon(
                    Icons.light_mode_outlined,
                    color: kWhiteColor,
                  )),
            ),
            kHeight(5),
            const Text(
              "Light Mode",
              style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
  }
}
