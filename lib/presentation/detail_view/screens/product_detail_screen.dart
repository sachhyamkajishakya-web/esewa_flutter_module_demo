import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:esewa_flutter_module/core/widgets/custom_scaffold.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:esewa_flutter_module/presentation/detail_view/widgets/image_section.dart';
import 'package:esewa_flutter_module/presentation/detail_view/widgets/item_info_section.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(imageUrl: widget.product.image),
            SizedBox(height: AppSpacing.lg),
            ItemInfoSection(product: widget.product),
            SizedBox(height: AppSpacing.xl),
            Text(
              widget.product.title,
              style: context.textTheme.displayLarge?.copyWith(height: 1.3),
            ),
            SizedBox(height: AppSpacing.md),
            if (context.width <= 600)
              ..._contentWithTitle(
                title: 'Product Category',
                content: widget.product.category,
              ),
            ..._contentWithTitle(
              title: 'Product Description',
              content: widget.product.description,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _contentWithTitle({
    required String title,
    required String content,
  }) => [
    SizedBox(height: AppSpacing.md),
    Text(title, style: context.textTheme.bodyLarge?.copyWith(letterSpacing: 0)),
    SizedBox(height: AppSpacing.xs),
    Text(
      content,
      style: context.textTheme.bodyLarge?.copyWith(
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.justify,
    ),
  ];
}
