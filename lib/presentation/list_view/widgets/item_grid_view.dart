import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/presentation/detail_view/screens/product_detail_screen.dart';
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
        childAspectRatio: 0.67,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) =>
                  ProductDetailScreen(product: products[index]),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: .circular(AppRadius.md),
              color: Color(0xffe3e3e3),
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
                      fit: .contain,
                      loadingBuilder: (context, child, loadingProgress) =>
                          Center(child: child),
                    ),
                  ),
                ),
                SizedBox(height: AppSpacing.md),
                ItemPriceRatingSection(product: products[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}
