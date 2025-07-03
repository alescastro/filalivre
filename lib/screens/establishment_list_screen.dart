import 'package:flutter/material.dart';
import '../widgets/establishment_card.dart';
import '../widgets/custom_button.dart';
import '../data/establishments_data.dart';

class EstablishmentListScreen extends StatelessWidget {
  static const routeName = '/establishments';

  const EstablishmentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String city = ModalRoute.of(context)?.settings.arguments as String;
    final establishments = establishmentsByCity[city] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Estabelecimentos em $city'),
        leading: const BackButton(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: establishments.isEmpty
                  ? const Center(
                      child: Text('Nenhum estabelecimento encontrado.'))
                  : ListView.builder(
                      itemCount: establishments.length,
                      itemBuilder: (context, index) {
                        final est = establishments[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: EstablishmentCard(
                            name: est['name'] ?? '',
                            type: est['type'] ?? '',
                            imagePath: est['image'] ?? '',
                            onEnter: () {
                              // dialog de confirmação de presença
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    '📍 Confirme sua presença',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Para entrar na fila, é necessário estar no estabelecimento.\n\n'
                                    'Você confirma que já está no local?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancelar'),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF3B82F6),
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushNamed(
                                          context,
                                          '/queue',
                                          arguments: {
                                            'establishment': est,
                                            'city': city,
                                          },
                                        );
                                      },
                                      child: const Text('Sim, estou no local'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 12),
            CustomButton(
              label: 'Voltar para cidades',
              icon: Icons.arrow_back,
              onPressed: () => Navigator.pop(context),
              color: const Color(0xFF3B82F6),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
