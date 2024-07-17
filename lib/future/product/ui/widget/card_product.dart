import 'package:flutter/material.dart';

import '../../data/model/response_product/product.dart';
import 'product_component.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key, required this.product});
  final List<Product> product;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8),
        itemCount: product.length,
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductComponent(
            id: product[index].id ?? 0,
            image: product[index].images!.first,
            name: product[index].title ?? '',
            description: product[index].description ?? '',
            price: product[index].discountPercentage.toString(),
            desPrice: product[index].price.toString(),
            rate: product[index].rating.toString(),
          );
        },
      ),
    );
  }
}
