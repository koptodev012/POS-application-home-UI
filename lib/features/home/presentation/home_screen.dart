import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/drawer_pages/home_section/presentation/home_section.dart';
import 'package:home_design/features/drawer_pages/menu_section/presentation/menu_section.dart';
import 'package:home_design/features/drawer_pages/order_section/presentation/order_section.dart';
import 'package:home_design/features/drawer_pages/payment_section/presentation/payment_section.dart';
import 'package:home_design/features/drawer_pages/setting_section/presentation/setting_section.dart';
import 'package:home_design/features/drawer_pages/staff_section/presentation/staff_section.dart';
import 'package:home_design/features/home/drawer/cubit/select_page_index/page_index_cubit.dart';
import 'package:home_design/features/home/drawer/presentation/home_drawer.dart';
import 'package:home_design/features/home/header/presentation/header.dart';
import 'package:home_design/features/home/order_screen/order_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [
    const HomeSection(),
    const MenuSection(),
    const OrderSection(),
    const PaymentSection(),
    const StaffSection(),
    const SettingSection()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          //! Main Container 1
          Expanded(
            flex: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(
                      color: CommonColors.buttontextColor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: const Column(
                  children: [
                    HomeDrawer(),
                  ],
                )),
          ),

          //! Main Container 2,

          Expanded(
            flex: 7,
            child: Column(
              children: [
                //? Sub Container 1

                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: const Header(),
                  ),
                ),

                //? Sub Container 2

                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: BlocBuilder<PageIndexCubit, PageIndexState>(
                      builder: (context, state) {
                        if (state is PageIndexSuccessState) {
                          log("Cubit Page index selected: ${state.pageIndex}");
                          return Container(
                            decoration: BoxDecoration(
                                color: CommonVariables.selectIndex != 5
                                    ? CommonColors.homeContainerBg
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: screens[state.pageIndex],
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),

                //? Sub Container 3

                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          //! Main Container 3

          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: CommonColors.buttontextColor,
                    width: 1.0,
                  ),
                ),
              ),
              child: const OrderDetails(),
            ),
          ),
        ],
      ),
    );
  }
}