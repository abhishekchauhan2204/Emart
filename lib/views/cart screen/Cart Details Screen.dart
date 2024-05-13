import 'package:flutter/material.dart';

import 'Product Details Screen.dart';
import 'cart model.dart';


class CartDetailsScreen extends StatelessWidget {
  final Cart cart;

  CartDetailsScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.purple,
        title: Text('Cart Details'),
      ),
      body: Container(decoration: BoxDecoration(
          color: Colors.purple.shade200,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black,spreadRadius: 1,blurRadius: 1,blurStyle:  BlurStyle.solid)
          ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('user ID: ${cart.userId}'),
            Text('Total Products: ${cart.totalProducts}'),
            Text('Total Quantity: ${cart.totalQuantity}'),
            Text('Total: \$${cart.total}'),
            Text('Discounted Total: \$${cart.discountedTotal}'),
            // You can display more attributes here
            SizedBox(height: 20),
            Text(
              'Products:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cart.products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(cart.products[index].thumbnail),
                    ),
                    title: Text(cart.products[index].title),
                    subtitle: Text('Price: \$${cart.products[index].price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(product: cart.products[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
