import 'dart:io';

import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:esewa_flutter_module/core/helper/android_method_channel_helper.dart';
import 'package:esewa_flutter_module/core/helper/ios_method_channel_helper.dart';
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
      horizontalPadding: 0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: .only(
              left: AppSpacing.md,
              right: AppSpacing.md,
              bottom: 130,
            ),
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
                    title: context.l10n.productCategory,
                    content: widget.product.category,
                  ),
                ..._contentWithTitle(
                  title: context.l10n.productDescription,
                  content: widget.product.description,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: .symmetric(horizontal: AppSpacing.md),
              height: 120,
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: [
                  BoxShadow(
                    color: context.theme.primaryColor.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: Offset(0, -5), // negative y pushes shadow upward
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.totalPrice,
                          style: context.textTheme.displayMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: AppSpacing.xs),
                        Text(
                          context.l10n.price(
                            widget.product.price.toStringAsFixed(2),
                          ),
                          style: context.textTheme.displayLarge?.copyWith(
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 80),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => Platform.isIOS
                          ? IosMethodChannelHelper.sendSelectedItemAndGoBack(
                              widget.product,
                            )
                          : AndroidMethodChannelHelper.sendSelectedItemAndGoBack(
                              widget.product,
                            ),
                      child: Container(
                        height: context.width <= 600 ? 50 : 60,
                        decoration: BoxDecoration(
                          borderRadius: .circular(AppRadius.md),
                          color: context.theme.primaryColorLight,
                        ),
                        child: Center(
                          child: Text(
                            context.l10n.pay,
                            style: context.textTheme.displayLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
