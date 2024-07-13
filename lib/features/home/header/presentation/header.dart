import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/images/images.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/common/widgets/theme_changed_button.dart';
import 'package:home_design/features/home/header/cubit/change_theme/change_theme_cubit.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
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
                          style: GoogleFonts.cormorant(
                            textStyle: TextStyle(
                                color: CommonColors.buttontextColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
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
                      //! Theme Mode,

                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: ThemeChangedButton(),
                      ),

                      //! .....................

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
                        width: DeviceUtils.getDeviceDimension(context).width *
                            0.05,
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
                                            color: CommonVariables.isDarkMode ==
                                                    false
                                                ? Colors.black
                                                : Colors.white,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .logout,
                                            style: TextStyle(
                                              color:
                                                  CommonVariables.isDarkMode ==
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
      },
    );
  }
}
