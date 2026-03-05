import 'package:esewa_flutter_module/core/constants/spacing.dart';
import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Stack(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            padding: .symmetric(vertical: AppSpacing.md),
            decoration: BoxDecoration(
              borderRadius: .circular(AppRadius.md),
              color: context.theme.cardColor,
            ),
            child: Image.network(
              imageUrl,
              fit: .contain,
              loadingBuilder: (context, child, loadingProgress) =>
                  Center(child: child),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: .only(left: AppRadius.md),
              decoration: BoxDecoration(
                borderRadius: .circular(AppRadius.md),
                color: context.theme.primaryColorLight,
              ),
              height: 38,
              width: 38,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: AppIconSize.md,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
