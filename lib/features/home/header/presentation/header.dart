import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/images/images.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/header/cubit/change_theme/change_theme_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CommonVariables.isDarkMode == false
          ? Colors.white
          : CommonColors.darkModeColorPrimary,
      child: Row(
        children: [
          //! Container 1

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 17,
                      backgroundImage: AssetImage(
                        CommonImages.headerLogo,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      AppLocalizations.of(context)!.welcomeTo,
                      style: TextStyle(
                          color: CommonColors.buttontextColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),

          //! Container 2
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //* Theme Mode,

                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: FlutterSwitch(
                      width: 60.0,
                      height: 35.0,
                      value: CommonVariables.isDarkMode,
                      borderRadius: 30.0,
                      padding: 8.0,
                      activeToggleColor: Colors.black,
                      inactiveToggleColor: Colors.white,
                      activeIcon: const Icon(Icons.nightlight_round,
                          color: Colors.white),
                      inactiveIcon:
                          const Icon(Icons.wb_sunny, color: Colors.yellow),
                      onToggle: (value) {
                        setState(() {
                          CommonVariables.isDarkMode = value;
                          log("Theme mode - ${CommonVariables.isDarkMode}");
                        });

                        BlocProvider.of<ChangeThemeCubit>(context)
                            .isChangedThemeFunction(CommonVariables.isDarkMode);
                      },
                    ),
                  ),

                  //* .....................

                  const Icon(CupertinoIcons.bell_fill),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20),
                    child: Icon(CupertinoIcons.device_laptop),
                  ),
                  CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                        CommonImages.userImg,
                      )),
                  SizedBox(
                    width: DeviceUtils.getDeviceDimension(context).width * 0.05,
                  ),
                  PopupMenuButton(
                      position: PopupMenuPosition.over,
                      icon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: CommonVariables.isDarkMode == false
                            ? Colors.black
                            : Colors.white,
                        size: 20,
                      ),
                      color: CommonVariables.isDarkMode == false
                          ? Colors.white
                          : CommonColors.darkModeColorPrimary,
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                onTap: () {},
                                textStyle: TextStyle(
                                  color: CommonVariables.isDarkMode == false
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.square_arrow_right,
                                        color:
                                            CommonVariables.isDarkMode == false
                                                ? Colors.black
                                                : Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.logout,
                                        style: TextStyle(
                                          color: CommonVariables.isDarkMode ==
                                                  false
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
