import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:esewa_flutter_module/core/widgets/star_icon.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:flutter/material.dart';

class ItemPriceRatingSection extends StatelessWidget {
  const ItemPriceRatingSection({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .only(top: AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: .only(
          bottomLeft: .circular(AppRadius.md),
          bottomRight: .circular(AppRadius.md),
        ),
      ),
      padding: .symmetric(vertical: AppSpacing.xs, horizontal: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.category,
            style: context.textTheme.displaySmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppSpacing.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "\$${product.price.toStringAsFixed(2)}",
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  StarIcon(size: AppIconSize.md),
                  SizedBox(width: 2),
                  Text(
                    product.rating.rate.toStringAsFixed(2),
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
