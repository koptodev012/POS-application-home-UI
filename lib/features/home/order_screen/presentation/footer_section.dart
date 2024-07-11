import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
            child: Divider(
              color: Colors.black.withOpacity(0.2),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
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
                          color: cancelColor,
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
                  width: DeviceUtils.getDeviceDimension(context).width * 0.03,
                ),
                Expanded(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                          color: CommonColors.placeBtnOrder,
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
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
