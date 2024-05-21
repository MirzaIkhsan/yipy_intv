import 'package:flutter/material.dart';

extension ListWidgetExt on List<Widget> {
  List<Widget> addSpaceVertically(double height) {
    if (length <= 1) return this;
    return sublist(1).fold([first], (r, element) {
      return [
        ...r,
        SizedBox(height: height),
        element,
      ];
    });
  }
}
