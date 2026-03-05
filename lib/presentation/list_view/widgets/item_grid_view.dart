import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:esewa_flutter_module/presentation/list_view/widgets/item_price_rating_section.dart';
import 'package:flutter/material.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: .circular(AppRadius.md),
            color: context.theme.cardColor,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: .only(
                    left: AppSpacing.sm,
                    right: AppSpacing.sm,
                    top: AppSpacing.sm,
                  ),
                  child: Image.network(
                    products[index].image,
                    scale: 3,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) =>
                        Center(child: child),
                  ),
                ),
              ),
              ItemPriceRatingSection(product: products[index]),
            ],
          ),
        );
      },
    );
  }
}
