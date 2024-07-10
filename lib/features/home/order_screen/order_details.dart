import 'package:flutter/material.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/shimmer_effect/presentation/shimmer_effect.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
    return Column(
      children: [
        //! Sub Container 1,

        Expanded(
            flex: 2,
            child: Container(
              // color: Colors.orange,
              child: const ShimmerEffect(),
            )),

        //! Sub Container 2,

        Expanded(
            flex: 7,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height:
                              DeviceUtils.getDeviceDimension(context).height *
                                  0.05,
                          width: DeviceUtils.getDeviceDimension(context).width *
                              0.14,
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                            decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: CommonColors.darkColor,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: CommonColors.lightTextColor),
                              prefixIcon: Icon(
                                Icons.search,
                                color: CommonColors.lightTextColor,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: AppLocalizations.of(context)!
                                  .searchWithItemName,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),

        //! Sub Container 3,

        Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                    child: Divider(
                      color: Colors.black.withOpacity(0.2),
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 8),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 8),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 8),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 8),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 8),
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
                          width: DeviceUtils.getDeviceDimension(context).width *
                              0.03,
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
            )),
      ],
    );
  }
}
