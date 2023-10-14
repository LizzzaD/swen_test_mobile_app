import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';
import '../buttons/circle_button.dart';

class CarbonFootprintSummaryWidget extends StatelessWidget {
  const CarbonFootprintSummaryWidget({
    required this.buttonAnimation,
    super.key,
  });

  final Animation<double> buttonAnimation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '1233',
          style: context.styles.regular72.copyWith(color: context.colors.black),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 53, bottom: 19),
          child: Text(
            'tCO₂e',
            style: context.styles.medium18.copyWith(color: context.colors.black50),
          ),
        ),
        const Spacer(),
        AnimatedBuilder(
          animation: buttonAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(buttonAnimation.value, 0),
              child: CircleButton(onPressed: () {}),
            );
          },
        ),
      ],
    );
  }
}
