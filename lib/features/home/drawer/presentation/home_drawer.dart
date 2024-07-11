import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/images/images.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/drawer/cubit/isCollpasedValue/is_collpased_value_cubit.dart';
import 'package:home_design/features/home/drawer/cubit/select_page_index/page_index_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:rotation/rotation.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  RotatorFlipState _flipState = RotatorFlipState.showFirst;

  void toggleIsCollapsed() {
    setState(() {
      CommonVariables.isCollapsed = !CommonVariables.isCollapsed;
      log("isCollpased: ${CommonVariables.isCollapsed}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // --------------------------------------------------------------------

    var screenWidth = DeviceUtils.getDeviceDimension(context).width;
    var screenHeight = DeviceUtils.getDeviceDimension(context).height;
    log('screenHeight: $screenHeight');
    log('screenWidth: $screenWidth');

    List buttonNameListEnglish = [
      {
        "buttonName": AppLocalizations.of(context)!.home,
        "buttonIcon": CupertinoIcons.house_fill
      },
      {
        "buttonName": AppLocalizations.of(context)!.menu,
        "buttonIcon": CupertinoIcons.square_list_fill
      },
      {
        "buttonName": AppLocalizations.of(context)!.orders,
        "buttonIcon": CupertinoIcons.bag_fill
      },
      {
        "buttonName": AppLocalizations.of(context)!.payments,
        "buttonIcon": CupertinoIcons.flame_fill,
      },
      {
        "buttonName": AppLocalizations.of(context)!.staff,
        "buttonIcon": CupertinoIcons.person_2_square_stack_fill
      },
      {
        "buttonName": AppLocalizations.of(context)!.settings,
        "buttonIcon": CupertinoIcons.gear_alt_fill
      },
    ];

    // ---------------------------------------------------------------------

    return Column(
      children: [
        //! Logo

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  CommonImages.headerLogo,
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.05,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: screenHeight * 0.02,
        ),

        //! Buttons

        ListView.builder(
            shrinkWrap: true,
            itemCount: buttonNameListEnglish.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: index == CommonVariables.selectIndex
                                ? CommonColors.buttonBgColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment:
                                  CommonVariables.isCollapsed == false
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                              children: [
                                Icon(
                                  buttonNameListEnglish[index]["buttonIcon"],
                                  color: index == CommonVariables.selectIndex
                                      ? CommonColors.buttontextColor
                                      : Colors.black.withOpacity(0.5),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: CommonVariables.isCollapsed == false
                                      ? Text(
                                          buttonNameListEnglish[index]
                                              ["buttonName"],
                                          style: TextStyle(
                                            color: index ==
                                                    CommonVariables.selectIndex
                                                ? CommonColors.buttontextColor
                                                : Colors.black.withOpacity(0.5),
                                          ),
                                        )
                                      : const SizedBox(),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            CommonVariables.selectIndex = index;
                          });

                          BlocProvider.of<PageIndexCubit>(context)
                              .selectPageIndexFunction();
                        },
                      ),
                    ))
                  ],
                ),
              );
            }),

        //! Collapse,

        SizedBox(
          height: DeviceUtils.getDeviceDimension(context).height * 0.20,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.black.withOpacity(0.2),
            thickness: 1.0,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: GestureDetector(
                  child: RotatorFlip(
                    duration: const Duration(milliseconds: 400),
                    flipState: _flipState,
                    firstChild: Icon(CupertinoIcons.back),
                    secondChild: Icon(CupertinoIcons.chevron_forward),
                  ),
                  onTap: () {
                    toggleIsCollapsed();

                    setState(() {
                      _flipState == RotatorFlipState.showFirst
                          ? _flipState = RotatorFlipState.showSecond
                          : _flipState = RotatorFlipState.showFirst;
                    });

                    BlocProvider.of<IsCollpasedValueCubit>(context)
                        .setIsCollapsed(CommonVariables.isCollapsed);
                  }),
            ),
            CommonVariables.isCollapsed == false
                ? Text(
                    "Collpase",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1,
                        color: Colors.black.withOpacity(0.5)),
                  )
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}
