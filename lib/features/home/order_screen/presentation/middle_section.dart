import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_design/common/widgets/searchbar.dart';

class OrderDetailsMiddleSection extends StatefulWidget {
  const OrderDetailsMiddleSection({super.key});

  @override
  State<OrderDetailsMiddleSection> createState() =>
      _OrderDetailsMiddleSectionState();
}

class _OrderDetailsMiddleSectionState extends State<OrderDetailsMiddleSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        children: [
          Padding(padding: EdgeInsets.all(8.0), child: CommonSearchbar()),
        ],
      ),
    );
  }
}
