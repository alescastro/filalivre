import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Imagem de boas-vindas
              Image.asset(
                'assets/images/welcome.png',
                height: 280,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              // Título
              const Text(
                'Bem-vindo ao FilaLivre',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 12),

              // Subtítulo
              const Text(
                'Evite filas e ganhe tempo nos seus atendimentos.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // Botão
              CustomButton(
                label: 'Começar',
                onPressed: () {
                  Navigator.pushNamed(context, '/city');
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
