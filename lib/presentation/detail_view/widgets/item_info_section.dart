import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:esewa_flutter_module/core/widgets/star_icon.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:flutter/material.dart';

class ItemInfoSection extends StatefulWidget {
  const ItemInfoSection({super.key, required this.product});
  final Product product;

  @override
  State<ItemInfoSection> createState() => _ItemInfoSectionState();
}

class _ItemInfoSectionState extends State<ItemInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ratings(),
        _horizontalDivider(),
        _textWidget(context.l10n.reviews(widget.product.rating.count.toInt())),
        if (context.width > 600) ...[
          _horizontalDivider(),
          _textWidget(widget.product.category),
        ],
      ],
    );
  }

  Widget _ratings() => Row(
    children: [
      StarIcon(size: AppIconSize.md),
      SizedBox(width: AppSpacing.xs),
      _textWidget(
        context.l10n.ratings(widget.product.rating.rate.toStringAsFixed(2)),
      ),
    ],
  );

  Widget _textWidget(String text) => Text(
    text,
    style: context.textTheme.displaySmall?.copyWith(
      fontWeight: FontWeight.bold,
    ),
  );

  Widget _horizontalDivider() => Container(
    height: AppSpacing.lg,
    width: 2,
    color: context.theme.dividerColor,
    margin: .symmetric(horizontal: 16),
  );
}
