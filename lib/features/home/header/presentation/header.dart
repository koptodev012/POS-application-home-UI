import 'package:flutter/material.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/images/images.dart';
import 'package:home_design/common/utils/device_dimension.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
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
                    "Welcome to",
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
                const Icon(Icons.notifications),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20),
                  child: Icon(Icons.computer),
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
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
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
