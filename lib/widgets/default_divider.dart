import 'package:flutter/material.dart';

class DefaulDivider extends StatelessWidget {
  const DefaulDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: const Color(0xFFE9E9E9),
    );
  }
}
