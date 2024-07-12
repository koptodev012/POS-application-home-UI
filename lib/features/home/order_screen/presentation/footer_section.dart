import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/header/cubit/change_theme/change_theme_cubit.dart';
import 'package:home_design/features/home/order_screen/cubit/successful_placeOrder_icon/successul_place_order_icon_cubit.dart';

class OrderDetailsFooterSection extends StatefulWidget {
  const OrderDetailsFooterSection({super.key});

  @override
  State<OrderDetailsFooterSection> createState() =>
      _OrderDetailsFooterSectionState();
}

class _OrderDetailsFooterSectionState extends State<OrderDetailsFooterSection> {
  //! ------------------------------------------------------------------

  // For Cancel order Button

  Color cancelColor = CommonColors.cancelBtnColor;
  int _enterCounter1 = 0;
  int _exitCounter1 = 0;
  double x1 = 0.0;
  double y1 = 0.0;

  void _incrementEnter1(PointerEvent details) {
    setState(() {
      _enterCounter1++;
    });
  }

  void _incrementExit1(PointerEvent details) {
    setState(() {
      cancelColor = CommonColors.cancelBtnColor;
      _exitCounter1++;
    });
  }

  void _updateLocation1(PointerEvent details) {
    setState(() {
      cancelColor = Colors.red;
      x1 = details.position.dx;
      y1 = details.position.dy;
    });
  }

  //! ------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return Container(
          color: CommonVariables.isDarkMode == false
              ? Colors.white
              : CommonColors.darkModeColorPrimary,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                child: Divider(
                  color: CommonVariables.isDarkMode == false
                      ? Colors.black.withOpacity(0.2)
                      : CommonColors.darkModeColorPrimary,
                  thickness: 1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.subtotal,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      "0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.taxed,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      "0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.discount,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      "0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.total,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      "0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),

              //! Buttons

              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: _incrementEnter1,
                        onHover: _updateLocation1,
                        onExit: _incrementExit1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: CommonVariables.isDarkMode == false
                                  ? cancelColor
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              AppLocalizations.of(context)!.cancelOrder,
                              style: const TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:
                          DeviceUtils.getDeviceDimension(context).width * 0.03,
                    ),
                    Expanded(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                color: CommonVariables.isDarkMode == false
                                    ? CommonColors.placeBtnOrder
                                    : Colors.blue,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                AppLocalizations.of(context)!.placedOrder,
                                style: const TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                          onTap: () {
                            BlocProvider.of<SuccessulPlaceOrderIconCubit>(
                                    context)
                                .placeOrderSuccessFunction();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
