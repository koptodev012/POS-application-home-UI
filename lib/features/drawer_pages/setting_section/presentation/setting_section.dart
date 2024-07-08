import 'package:flutter/material.dart';

class SettingSection extends StatefulWidget {
  const SettingSection({super.key});

  @override
  State<SettingSection> createState() => _SettingSectionState();
}

class _SettingSectionState extends State<SettingSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Setting Section"),
    );
  }
}
