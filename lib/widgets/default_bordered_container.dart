import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultBorderedContainer extends StatelessWidget {
  const DefaultBorderedContainer({
    super.key,
    this.borderRadius,
    this.color,
    this.borderColor,
    this.child,
  });

  final BorderRadius? borderRadius;
  final Color? color;
  final Color? borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: border,
      ),
      child: child,
    );
  }

  BoxBorder? get border {
    if (borderColor == null) return null;
    return Border.all(color: borderColor!, width: 1);
  }
}
