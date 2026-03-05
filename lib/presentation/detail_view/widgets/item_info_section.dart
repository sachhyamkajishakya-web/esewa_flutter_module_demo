import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:flutter/material.dart';

class ItemInfoSection extends StatelessWidget {
  const ItemInfoSection({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.star, size: AppIconSize.lg, color: Colors.yellow),
            SizedBox(width: AppSpacing.xs),
            Text(
              context.l10n.ratings(product.rating.rate.toStringAsFixed(2)),
              style: context.textTheme.displayLarge?.copyWith(fontSize: 20),
            ),
          ],
        ),
        Container(
          height: 16,
          width: 2,
          color: Colors.grey,
          margin: .symmetric(horizontal: 16),
        ),
        Text(
          context.l10n.reviews(product.rating.count.toInt()),
          style: context.textTheme.displayLarge,
        ),
        Container(
          height: 16,
          width: 2,
          color: Colors.grey,
          margin: .symmetric(horizontal: 16),
        ),
        Text(
          product.category,
          style: context.textTheme.displayLarge?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
