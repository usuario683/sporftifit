import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/user_provider.dart';
import 'screens/login_screen.dart';
import 'screens/products_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    return email != null && email.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SportFit Store',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: FutureBuilder<bool>(
        future: _checkLogin(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.data == true) {
            return const ProductsScreen(); // ✅ Va directo si hay sesión guardada
          } else {
            return const LoginScreen(); // ✅ Muestra login si no hay usuario guardado
          }
        },
      ),
    );
  }
}
