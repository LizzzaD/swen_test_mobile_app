import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';
import '../../images/svg_icons.dart';
import '../buttons/default_button.dart';

class TimeRangeSelectorWidget extends StatelessWidget {
  const TimeRangeSelectorWidget({required this.onPressed, required this.time, super.key});

  final VoidCallback onPressed;
  final String time;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.black13),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                time,
                style: context.styles.regular18.copyWith(color: context.colors.black),
              ),
            ),
            SVGIcon.filter.build(),
          ],
        ),
      ),
    );
  }
}
