import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/variables.dart';
import 'package:home_design/features/home/header/cubit/change_theme/change_theme_cubit.dart';

class OrderDetailsHeaderSection extends StatefulWidget {
  const OrderDetailsHeaderSection({super.key});

  @override
  State<OrderDetailsHeaderSection> createState() =>
      _OrderDetailsHeaderSectionState();
}

class _OrderDetailsHeaderSectionState extends State<OrderDetailsHeaderSection> {
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
              //! 1st Row

              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 8, right: 8, bottom: 2),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "table#",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffCEF0F9),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    "ft-1",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //! 2nd Row,

              Padding(
                padding: EdgeInsets.only(top: 3.0, left: 8, right: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Guest",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Icon(CupertinoIcons.minus_square_fill),
                            onTap: () {
                              if (CommonVariables.guestSize > 0) {
                                setState(() {
                                  CommonVariables.guestSize--;
                                });
                              }
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              CommonVariables.guestSize.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            child: Icon(CupertinoIcons.plus_square_fill),
                            onTap: () {
                              if (CommonVariables.guestSize < 5) {
                                setState(() {
                                  CommonVariables.guestSize++;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //! 3rd Row,

              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Item ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Quantity ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
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
