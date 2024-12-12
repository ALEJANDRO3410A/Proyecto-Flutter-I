import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
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
