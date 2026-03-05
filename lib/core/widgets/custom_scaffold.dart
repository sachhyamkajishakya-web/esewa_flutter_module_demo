import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: .symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        child: child,
      ),
    );
  }
}
