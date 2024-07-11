import 'package:flutter/material.dart';
import 'package:home_design/features/home/order_screen/presentation/footer_section.dart';
import 'package:home_design/features/home/order_screen/presentation/header_section.dart';
import 'package:home_design/features/home/order_screen/presentation/middle_section.dart';

class HomeOrderDetails extends StatefulWidget {
  const HomeOrderDetails({super.key});

  @override
  State<HomeOrderDetails> createState() => _HomeOrderDetailsState();
}

class _HomeOrderDetailsState extends State<HomeOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //! Sub Container 1,

        Expanded(flex: 2, child: OrderDetailsHeaderSection()),

        //! Sub Container 2,

        Expanded(flex: 7, child: OrderDetailsMiddleSection()),

        //! Sub Container 3,

        Expanded(flex: 3, child: OrderDetailsFooterSection()),
      ],
    );
  }
}
