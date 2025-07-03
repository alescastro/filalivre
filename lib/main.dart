import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/city_selection_screen.dart';
import 'screens/establishment_list_screen.dart';
import 'screens/queue_status_screen.dart';

void main() {
  runApp(FilaLivreApp());
}

class FilaLivreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FilaLivre',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF3B82F6), // azul médio
          brightness: Brightness.light,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3B82F6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (_) => WelcomeScreen(),
        CitySelectionScreen.routeName: (_) => CitySelectionScreen(),
        EstablishmentListScreen.routeName: (_) => EstablishmentListScreen(),
        QueueStatusScreen.routeName: (_) => QueueStatusScreen(),
      },
    );
  }
}
