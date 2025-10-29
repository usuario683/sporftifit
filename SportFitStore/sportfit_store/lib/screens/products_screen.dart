import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'contact_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Camiseta deportiva",
      "price": 19.99,
      "image":
          "https://www.skole.ec/1310-large_default/camiseta-deportiva-bicolor-con-logotipo-estampado.jpg",
    },
    {
      "name": "Pantalón de entrenamiento",
      "price": 29.99,
      "image":
          "https://assets.adidas.com/images/w_1880,f_auto,q_auto/33ad09c739a64ca3a1b6ed64ead6db74_9366/IT5113_21_model.jpg",
    },
    {
      "name": "Guantes de gimnasio",
      "price": 9.99,
      "image":
          "https://assets.adidas.com/images/w_1880,f_auto,q_auto/5d459cb8fb0543f19a32afd000b0e12b_9366/II5598_01_standard.jpg",
    },
    {
      "name": "Zapatillas SportFit",
      "price": 59.99,
      "image":
          "https://m.media-amazon.com/images/I/517wDiU3v3L._AC_SL1024_.jpg",
    },
    {
      "name": "Medias Deportivas",
      "price": 7.99,
      "image":
          "https://www.skole.ec/853-large_default/medias-deportivas-con-logo-del-colegio.jpg",
    },
    {
      "name": "Cuerda para saltar",
      "price": 12.49,
      "image":
          "https://m.media-amazon.com/images/I/71wm42EtoNL._AC_SL1500_.jpg",
    },
    {
      "name": "Mancuernas 5kg",
      "price": 24.99,
      "image":
          "https://www.kissu.com.ec/imagenes//productos/md/16584248870.jpg",
    },
    {
      "name": "Esterilla de yoga",
      "price": 14.99,
      "image":
          "https://http2.mlstatic.com/D_NQ_NP_2X_986413-MLU74273803640_022024-F.webp",
    },
    {
      "name": "Sudadera térmica",
      "price": 34.99,
      "image":
          "https://www.stadior.com/1090406-home_default/chaqueta-joma-confort-iv-azul-marino.jpg",
    },
    {
      "name": "Toalla deportiva",
      "price": 8.49,
      "image":
          "https://m.media-amazon.com/images/I/711-Vp7eFDL._AC_SL1500_.jpg",
    },
  ];

  // 🔹 Función para cerrar sesión correctamente
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // elimina todos los datos guardados

    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          "SportFit Store 🏋️",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF6A1B9A),
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFF7F2FA),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF6A1B9A)),
              child: Center(
                child: Text(
                  "Menú Principal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.store, color: Color(0xFF6A1B9A)),
              title: const Text("Productos"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Color(0xFF6A1B9A),
              ),
              title: const Text("Carrito"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Color(0xFF6A1B9A)),
              title: const Text("Contacto"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ContactScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFF6A1B9A)),
              title: const Text("Perfil"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Cerrar sesión"),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      product['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A148C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "\$${product['price'].toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}
