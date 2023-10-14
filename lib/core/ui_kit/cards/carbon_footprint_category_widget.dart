import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';
import '../buttons/default_button.dart';

class CarbonFootprintCategoryWidget extends StatelessWidget {
  const CarbonFootprintCategoryWidget({
    required this.flex,
    required this.icon,
    required this.color,
    required this.title,
    required this.number,
    required this.onPressed,
    super.key,
  });

  final int flex;
  final Widget icon;
  final Color color;
  final String title;
  final int number;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Hero(
        tag: title,
        child: DefaultButton(
          onPressed: onPressed,
          borderRadius: BorderRadius.circular(20),
          backgroundColor: color,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.colors.white50,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: 50,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: icon,
                  ),
                ),
                const Spacer(),
                Text(
                  title.toUpperCase(),
                  style: context.styles.medium12.copyWith(color: context.colors.black50),
                ),
                Row(
                  children: [
                    Text(
                      number.toString(),
                      style: context.styles.regular20.copyWith(color: context.colors.black),
                    ),
                    Text(
                      'kg',
                      style: context.styles.medium12.copyWith(
                        color: context.colors.black50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
