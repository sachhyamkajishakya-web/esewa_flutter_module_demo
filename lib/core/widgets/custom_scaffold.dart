import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child,
    this.horizontalPadding = AppSpacing.md,
  });
  final Widget child;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: .symmetric(
          horizontal: horizontalPadding!,
          vertical: AppSpacing.sm,
        ),
        child: child,
      ),
    );
  }
}
