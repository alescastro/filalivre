import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class QueueStatusScreen extends StatefulWidget {
  static const routeName = '/queue';

  @override
  State<QueueStatusScreen> createState() => _QueueStatusScreenState();
}

class _QueueStatusScreenState extends State<QueueStatusScreen> {
  int position = 3;
  late String place;
  late String city;

  @override
  void initState() {
    super.initState();
    simulateQueueAdvance();
  }

  void simulateQueueAdvance() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (position > 1) {
        setState(() {
          position--;
        });
      } else {
        timer.cancel();
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Atenção!'),
            content: const Text('Você é o próximo da fila!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Ok'),
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final establishment = args?['establishment'] ?? {};
    place = establishment['name'] ?? 'Estabelecimento';
    city = args?['city'] ?? 'Cidade';

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      appBar: AppBar(
        title: const Text('Fila Virtual'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const Text(
              'Você está na fila de:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              place,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            CircleAvatar(
              radius: 48,
              backgroundImage: const AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(height: 12),
            const Text('João',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'Sua posição: $position',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pessoas à frente: ${position - 1}',
                    style: TextStyle(
                        color: Colors.grey.shade600, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Tempo estimado de espera:',
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: (4 - position) / 3,
              minHeight: 10,
              color: const Color(0xFF3B82F6),
              backgroundColor: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 8),
            Text(
              '${position * 2} minutos restantes',
              style: const TextStyle(fontSize: 14),
            ),
            const Spacer(),
            CustomButton(
              label: 'Sair da fila',
              icon: Icons.exit_to_app,
              color: Colors.redAccent,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/establishments',
                  ModalRoute.withName('/city'),
                  arguments: city,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
