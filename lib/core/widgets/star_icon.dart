import 'package:flutter/material.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star, color: Colors.amber, size: size);
  }
}
