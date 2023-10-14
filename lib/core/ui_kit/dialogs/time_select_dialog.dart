import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../extension/build_context_extension.dart';
import '../buttons/default_button.dart';

class TimeSelectDialog extends StatefulWidget {
  const TimeSelectDialog({required this.selected, super.key});

  final String selected;

  @override
  State<TimeSelectDialog> createState() => _TimeSelectDialogState();

  static Future<String?> show({required BuildContext context, required String selected}) {
    return showMaterialModalBottomSheet(
      context: context,
      builder: (context) {
        return TimeSelectDialog(selected: selected);
      },
      backgroundColor: Colors.transparent,
    );
  }
}

class _TimeSelectDialogState extends State<TimeSelectDialog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 480,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            width: 60,
            height: 5,
          ),
          const SizedBox(height: 4),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            height: 480 - 5 - 4,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildButton('Today'),
                _buildButton('Week'),
                _buildButton('Month'),
                _buildButton('Year'),
                _buildButton('All time'),
                _buildButton('Custom Range'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String name) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: DefaultButton(
            onPressed: () {
              Navigator.pop(context, name);
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: context.styles.regular36.copyWith(
                    color: widget.selected == name ? context.colors.black : context.colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(height: 1, color: context.colors.grey),
      ],
    );
  }
}
