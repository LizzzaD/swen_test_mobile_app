import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';
import '../../images/svg_icons.dart';
import 'default_button.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: DefaultButton(
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(20),
        backgroundColor: context.colors.purple,
        child: SVGIcon.add.build(),
      ),
    );
  }
}
