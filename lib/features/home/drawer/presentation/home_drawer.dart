import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/images/images.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/presentation/home_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  void initState() {
    setState(() {
      CommonVariables.selectIndex = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // --------------------------------------------------------------------

    var screenWidth = DeviceUtils.getDeviceDimension(context).width;
    var screenHeight = DeviceUtils.getDeviceDimension(context).height;
    log('screenHeight: $screenHeight');
    log('screenWidth: $screenWidth');

    List buttonNameList = [
      {"buttonName": "Home", "buttonIcon": Icons.home},
      {"buttonName": "Menu", "buttonIcon": Icons.menu},
      {"buttonName": "Orders", "buttonIcon": Icons.shop},
      {"buttonName": "Payments", "buttonIcon": Icons.payment},
      {"buttonName": "Staff", "buttonIcon": Icons.person},
      {"buttonName": "Settings", "buttonIcon": Icons.settings},
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
                  CommonImages.logo1,
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.07,
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
            itemCount: buttonNameList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
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
                            children: [
                              Icon(
                                buttonNameList[index]["buttonIcon"],
                                color: index == CommonVariables.selectIndex
                                    ? CommonColors.buttontextColor
                                    : Colors.black.withOpacity(0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  buttonNameList[index]["buttonName"],
                                  style: TextStyle(
                                    color: index == CommonVariables.selectIndex
                                        ? CommonColors.buttontextColor
                                        : Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          CommonVariables.selectIndex = index;
                          log('Drawer selectd Index: ${CommonVariables.selectIndex}');
                        });
                      },
                    ))
                  ],
                ),
              );
            }),
      ],
    );
  }
}
