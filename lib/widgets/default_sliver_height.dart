import 'package:flutter/material.dart';

class DefaultSliverHeight extends StatelessWidget {
  const DefaultSliverHeight({super.key, required this.gap});

  final double gap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: gap));
  }
}
