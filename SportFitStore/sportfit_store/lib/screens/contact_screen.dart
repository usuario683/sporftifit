import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contacto")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text("📞 WhatsApp: +593 987654321"),
            Text("✉️ sportfitstore@gmail.com"),
            Text("📍 Quito, Ecuador"),
            SizedBox(height: 20),
            Text("Síguenos en redes sociales"),
          ],
        ),
      ),
    );
  }
}
