import 'package:flutter/material.dart';

import 'cart model.dart';
 // Import your Cartmodel class

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.purple,
        title: Text('Product Details'),
      ),
      body: Container(decoration: BoxDecoration(
          color: Colors.purple.shade200,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black,spreadRadius: 1,blurRadius: 1,blurStyle:  BlurStyle.solid)
          ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(product.thumbnail),
              ),
              title: Text(product.title),
              subtitle: Text('Price: \$${product.price}'),
            ),
            SizedBox(height: 20),
            Text('Quantity: ${product.quantity}'),
            Text('Total: \$${product.total}'),
            Text('Discount Percentage: ${product.discountPercentage}%'),
            Text('Discounted Price: \$${product.discountedPrice}'),
            // You can display more attributes here
          ],
        ),
      ),
    );
  }
}
