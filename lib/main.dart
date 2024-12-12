import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';  // Importar Firebase Core
import 'package:restaurant_reservations/firebase_options.dart';  // Importar firebase_options.dart
import 'login_screen.dart'; // Tu pantalla de login

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegúrate de inicializar correctamente antes de cualquier otra cosa
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Usar la configuración de Firebase según la plataforma
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestión de Reservas',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
      },
    );
  }
}
