import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:flutter/material.dart';

class ItemPriceRatingSection extends StatelessWidget {
  const ItemPriceRatingSection({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .only(top: 10),
      decoration: BoxDecoration(
        borderRadius: .only(
          bottomLeft: .circular(10),
          bottomRight: .circular(10),
        ),
        color: Color(0xFFf2545b),
      ),
      padding: .all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "\$${product.price.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.white, size: 15),
              SizedBox(width: 2),
              Text(
                product.rating.rate.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
