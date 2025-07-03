import 'package:flutter/material.dart';

class EstablishmentCard extends StatelessWidget {
  final String name;
  final String type;
  final String imagePath; // <--- novo campo
  final VoidCallback onEnter;

  const EstablishmentCard({
    Key? key,
    required this.name,
    required this.type,
    required this.imagePath, // <--- novo campo
    required this.onEnter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 24,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(type),
        trailing: ElevatedButton(
          onPressed: onEnter,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3B82F6),
          ),
          child: const Text('Entrar'),
        ),
      ),
    );
  }
}
