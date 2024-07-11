import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/images/images.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.black,
                      size: 20,
                    ),
                    color: Colors.white,
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () {},
                              textStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(
                                      CupertinoIcons.square_arrow_right,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.logout,
                                      style: const TextStyle(
                                        color: Colors.black,
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
    );
  }
}
