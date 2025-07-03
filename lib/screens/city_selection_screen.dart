import 'package:flutter/material.dart';

class CitySelectionScreen extends StatelessWidget {
  static const routeName = '/city';

  final List<String> cities = [
    'Porto Alegre',
    'Passo Fundo',
    'Erechim',
    'Chapecó',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Escolha sua cidade',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Image.asset(
              'assets/images/city_banner.png',
              height: 160,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            const Text(
              'Selecione uma cidade para ver os estabelecimentos disponíveis.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // list de cidades
            Expanded(
              child: ListView.separated(
                itemCount: cities.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final city = cities[index];
                  return ElevatedButton.icon(
                    icon: const Icon(Icons.location_on_rounded, size: 20),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/establishments',
                        arguments: city,
                      );
                    },
                    label: Text(
                      city,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // button de localização atual
            TextButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Função de localização ainda está em construção!'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.gps_fixed, color: Colors.blue),
              label: const Text(
                'Usar minha localização',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
