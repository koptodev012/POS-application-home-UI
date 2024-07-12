import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/header/cubit/change_theme/change_theme_cubit.dart';

class ThemeChangedButton extends StatefulWidget {
  const ThemeChangedButton({super.key});

  @override
  State<ThemeChangedButton> createState() => _ThemeChangedButtonState();
}

class _ThemeChangedButtonState extends State<ThemeChangedButton> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      activeColor: CommonColors.darkModeColorPrimary,
      inactiveColor: Colors.white,
      activeToggleColor: CommonColors.darkModeColorSecondary,
      inactiveToggleColor: CommonColors.homeContainerBg,
      width: DeviceUtils.getDeviceDimension(context).width * 0.03,
      height: DeviceUtils.getDeviceDimension(context).height * 0.06,
      value: CommonVariables.isDarkMode,
      borderRadius: 30.0,
      padding: 8.0,
      activeIcon: const Icon(Icons.nightlight_round, color: Colors.white),
      inactiveIcon: const Icon(Icons.wb_sunny, color: Colors.black),
      onToggle: (value) {
        setState(() {
          CommonVariables.isDarkMode = value;
          log("Theme mode - ${CommonVariables.isDarkMode}");
        });

        BlocProvider.of<ChangeThemeCubit>(context)
            .isChangedThemeFunction(CommonVariables.isDarkMode);
      },
    );
  }
}
