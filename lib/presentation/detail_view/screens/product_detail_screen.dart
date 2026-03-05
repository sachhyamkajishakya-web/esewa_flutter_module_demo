import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:esewa_flutter_module/core/widgets/custom_scaffold.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:esewa_flutter_module/presentation/detail_view/widgets/image_section.dart';
import 'package:esewa_flutter_module/presentation/detail_view/widgets/item_info_section.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(imageUrl: product.image),
            SizedBox(height: AppSpacing.lg),
            ItemInfoSection(product: product),
            SizedBox(height: AppSpacing.xl),
            Text(product.title, style: context.textTheme.displayLarge),
            SizedBox(height: AppSpacing.lg),
            Text(product.description, style: context.textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
