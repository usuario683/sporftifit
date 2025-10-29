import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'contact_screen.dart';
import 'login_screen.dart'; // para poder volver al login al cerrar sesión

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    ProductsScreen(),
    CartScreen(),
    ContactScreen(),
    ProfileScreen(),
  ];

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // cerrar el menú lateral al cambiar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F2FA),
      appBar: AppBar(
        title: const Text(
          "SportFit Store 🏋️",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF6A1B9A),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
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
              leading: const Icon(Icons.storefront, color: Color(0xFF6A1B9A)),
              title: const Text("Productos"),
              onTap: () => _navigateTo(0),
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Color(0xFF6A1B9A),
              ),
              title: const Text("Carrito"),
              onTap: () => _navigateTo(1),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Color(0xFF6A1B9A)),
              title: const Text("Contacto"),
              onTap: () => _navigateTo(2),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFF6A1B9A)),
              title: const Text("Perfil"),
              onTap: () => _navigateTo(3),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Cerrar Sesión"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}
