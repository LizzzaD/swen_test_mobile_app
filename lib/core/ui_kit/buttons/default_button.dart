import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.borderRadius,
    this.backgroundColor,
    this.gradient,
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: gradient,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey.withOpacity(0.02),
          backgroundColor: backgroundColor ?? Colors.transparent,
          disabledForegroundColor: backgroundColor ?? Colors.transparent,
          disabledBackgroundColor: Colors.grey.withOpacity(0.02),
          shadowColor: Colors.grey.withOpacity(0.02),
          elevation: 0,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: child,
      ),
    );
  }
}
