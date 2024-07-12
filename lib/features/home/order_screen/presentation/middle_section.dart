import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/images/images.dart';
import 'package:home_design/common/utils/device_dimension.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/common/widgets/searchbar.dart';
import 'package:home_design/features/home/header/cubit/change_theme/change_theme_cubit.dart';
import 'package:home_design/features/home/order_screen/cubit/successful_placeOrder_icon/successul_place_order_icon_cubit.dart';

class OrderDetailsMiddleSection extends StatefulWidget {
  const OrderDetailsMiddleSection({super.key});

  @override
  State<OrderDetailsMiddleSection> createState() =>
      _OrderDetailsMiddleSectionState();
}

class _OrderDetailsMiddleSectionState extends State<OrderDetailsMiddleSection>
    with TickerProviderStateMixin {
  //! ------------------------------------------------------

  late final AnimationController placeIconcontroller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: placeIconcontroller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    placeIconcontroller.dispose();
    super.dispose();
  }
  //! ------------------------------------------------------

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
              const Padding(
                  padding: EdgeInsets.all(8.0), child: CommonSearchbar()),

              BlocBuilder<SuccessulPlaceOrderIconCubit,
                  SuccessulPlaceOrderIconState>(
                builder: (context, state) {
                  if (state is placeOrderSuccessState) {
                    return Column(
                      children: [
                        SizedBox(
                          height:
                              DeviceUtils.getDeviceDimension(context).height *
                                  0.13,
                        ),
                        RotationTransition(
                          turns: _animation,
                          child: Image.asset(
                            CommonImages.checkmark,
                            height:
                                DeviceUtils.getDeviceDimension(context).height *
                                    0.13,
                            width:
                                DeviceUtils.getDeviceDimension(context).width *
                                    0.06,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),

              // TODO: Add other widgets from here...
            ],
          ),
        );
      },
    );
  }
}
