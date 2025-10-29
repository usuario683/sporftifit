import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Image.asset(product.image, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(product.description),
                const SizedBox(height: 12),
                Text(
                  "\$${product.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<CartProvider>(
                      context,
                      listen: false,
                    ).addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Añadido al carrito")),
                    );
                  },
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text("Agregar al carrito"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
