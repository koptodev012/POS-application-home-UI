import 'package:flutter/material.dart';

class OrderSection extends StatefulWidget {
  const OrderSection({super.key});

  @override
  State<OrderSection> createState() => _OrderSectionState();
}

class _OrderSectionState extends State<OrderSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Order Section"),
    );
  }
}
