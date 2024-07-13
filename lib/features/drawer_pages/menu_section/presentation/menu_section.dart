import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/variables.dart';

class MenuSection extends StatefulWidget {
  const MenuSection({super.key});

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  //! --------------------------------------------------------------
  List<bool> _selected = List<bool>.generate(50, (index) => false);

  bool _selectAll = false;
  int? _selectedRowIndex;

  void _toggleSelectAll(bool? value) {
    setState(() {
      _selectAll = value ?? false;
      for (int i = 0; i < _selected.length; i++) {
        _selected[i] = _selectAll;
      }
    });
  }
  //! --------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: [
          DataColumn2(
            label: Checkbox(
              activeColor: CommonVariables.isDarkMode == false
                  ? CommonColors.textColorBlue
                  : Colors.white,
              checkColor: CommonVariables.isDarkMode == false
                  ? Colors.white
                  : CommonColors.textColorBlue,
              value: _selectAll,
              onChanged: _toggleSelectAll,
            ),
            size: ColumnSize.S,
          ),
          DataColumn2(
            label: Text(
              'Column A',
              style: TextStyle(color: CommonColors.textColorBlue),
            ),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text(
              'Column B',
              style: TextStyle(color: CommonColors.textColorBlue),
            ),
          ),
          DataColumn(
            label: Text(
              'Column C',
              style: TextStyle(color: CommonColors.textColorBlue),
            ),
          ),
          DataColumn(
            label: Text(
              'Column D',
              style: TextStyle(color: CommonColors.textColorBlue),
            ),
          ),
          DataColumn(
            label: Text(
              'Numbers',
              style: TextStyle(color: CommonColors.textColorBlue),
            ),
            numeric: true,
          ),
        ],
        rows: List<DataRow>.generate(
          50,
          (index) => DataRow(
            color: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (_selected[index]) {
                  return Colors.lightBlueAccent.withOpacity(0.3);
                }
                return null; // Use default color.
              },
            ),
            cells: [
              DataCell(
                Checkbox(
                  activeColor: CommonVariables.isDarkMode == false
                      ? CommonColors.textColorBlue
                      : Colors.white,
                  checkColor: CommonVariables.isDarkMode == false
                      ? Colors.white
                      : CommonColors.textColorBlue,
                  value: _selected[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _selected[index] = value ?? false;
                      if (!_selected[index]) {
                        _selectAll = false;
                      } else if (_selected.every((element) => element)) {
                        log("All checkbox selected");
                        _selectAll = true;
                      }
                      log("Checkbox selected Index: $index");
                    });
                  },
                ),
              ),

              // ---------------------------

              DataCell(Text('A' * (10 - index % 10))),
              DataCell(Text('B' * (10 - (index + 5) % 10))),
              DataCell(Text('C' * (15 - (index + 5) % 10))),
              DataCell(Text('D' * (15 - (index + 10) % 10))),
              DataCell(Text(((index + 0.1) * 25.4).toString())),
            ],
          ),
        ),
      ),
    );
  }
}
