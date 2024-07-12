import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/header/cubit/change_theme/change_theme_cubit.dart';

class CommonSearchbar extends StatefulWidget {
  const CommonSearchbar({super.key});

  @override
  State<CommonSearchbar> createState() => _CommonSearchbarState();
}

class _CommonSearchbarState extends State<CommonSearchbar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              height: DeviceUtils.getDeviceDimension(context).height * 0.05,
              width: DeviceUtils.getDeviceDimension(context).width * 0.14,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 14,
                  color: CommonVariables.isDarkMode == false
                      ? Colors.white
                      : Colors.black,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: CommonVariables.isDarkMode == false
                      ? CommonColors.darkColor
                      : Colors.white,
                  hintStyle: TextStyle(
                      fontSize: 14, color: CommonColors.lightTextColor),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CommonColors.lightTextColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: AppLocalizations.of(context)!.searchWithItemName,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
