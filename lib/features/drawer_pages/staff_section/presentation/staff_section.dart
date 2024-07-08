import 'package:flutter/material.dart';

class StaffSection extends StatefulWidget {
  const StaffSection({super.key});

  @override
  State<StaffSection> createState() => _StaffSectionState();
}

class _StaffSectionState extends State<StaffSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Staff Section"),
    );
  }
}
