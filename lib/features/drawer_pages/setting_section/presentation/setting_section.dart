import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/localization/cubit/change_language/change_language_cubit.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:home_design/common/variables.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SettingSection extends StatefulWidget {
  const SettingSection({super.key});

  @override
  State<SettingSection> createState() => _SettingSectionState();
}

class _SettingSectionState extends State<SettingSection> {
  bool _switchValue1 = true;
  bool _switchValue2 = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context)!.settings,
                    style:
                        TextStyle(color: CommonColors.darkColor, fontSize: 18),
                  ),
                ),
                Divider(
                  color: Colors.black.withOpacity(0.2),
                  thickness: 1.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
            child: WidgetAnimator(
              incomingEffect:
                  WidgetTransitionEffects.incomingSlideInFromBottom(),
              child: Container(
                decoration: BoxDecoration(
                    color: CommonColors.homeContainerBg,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //! Menu

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: const Icon(
                                            CupertinoIcons.square_list_fill),
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: Text(
                                            AppLocalizations.of(context)!.menu),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.keyboard_arrow_right,
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Divider(
                                  color: CommonColors.dividerColor,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //! Tables

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .tables),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.keyboard_arrow_right,
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Divider(
                                  color: CommonColors.dividerColor,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //! Language

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .language),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Text(
                                                CommonVariables
                                                    .selectedLanguage,
                                                style: TextStyle(
                                                    color: CommonColors
                                                        .textColorBlue),
                                              ),
                                            ),
                                            BlocBuilder<ChangeLanguageCubit,
                                                ChangeLanguageState>(
                                              builder: (context, state) {
                                                return PopupMenuButton(
                                                    position:
                                                        PopupMenuPosition.over,
                                                    icon: const Icon(
                                                      Icons
                                                          .keyboard_arrow_down_sharp,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                    color: Colors.white,
                                                    itemBuilder: (context) => [
                                                          PopupMenuItem(
                                                              onTap: () {},
                                                              textStyle:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            4.0),
                                                                    child:
                                                                        InkWell(
                                                                      child:
                                                                          const Text(
                                                                        "English",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        BlocProvider.of<ChangeLanguageCubit>(context)
                                                                            .ChangelanguageFunction(const Locale('en'));

                                                                        setState(
                                                                            () {
                                                                          CommonVariables.selectedLanguage =
                                                                              "English";
                                                                        });

                                                                        log("Selected language: ${CommonVariables.selectedLanguage}");

                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            4.0),
                                                                    child:
                                                                        InkWell(
                                                                      child:
                                                                          const Text(
                                                                        "Arabic",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        BlocProvider.of<ChangeLanguageCubit>(context)
                                                                            .ChangelanguageFunction(const Locale('ar'));

                                                                        setState(
                                                                            () {
                                                                          CommonVariables.selectedLanguage =
                                                                              "عربي";
                                                                        });

                                                                        log("Selected language: ${CommonVariables.selectedLanguage}");
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                  )
                                                                ],
                                                              )),
                                                        ]);
                                              },
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Divider(
                                  color: CommonColors.dividerColor,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //! Sounds,

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .sounds),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CupertinoSwitch(
                                              activeColor:
                                                  CommonColors.textColorBlue,
                                              trackColor:
                                                  CommonColors.darkColor,
                                              value: _switchValue1,
                                              onChanged: (value) {
                                                setState(() {
                                                  _switchValue1 = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Divider(
                                  color: CommonColors.dividerColor,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //! Notifications

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                      )),
                                  Expanded(
                                      flex: 8,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .notifications),
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: SizedBox(
                                        height: DeviceUtils.getDeviceDimension(
                                                    context)
                                                .height *
                                            0.04,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            CupertinoSwitch(
                                              activeColor:
                                                  CommonColors.textColorBlue,
                                              trackColor:
                                                  CommonColors.darkColor,
                                              value: _switchValue2,
                                              onChanged: (value) {
                                                setState(() {
                                                  _switchValue2 = value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Divider(
                                  color: CommonColors.dividerColor,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
