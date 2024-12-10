import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestión de Reservas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(role: 'admin'), // Cambia 'admin' a 'cliente' para pruebas
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String role; // 'admin' o 'cliente'

  HomeScreen({required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Reservas'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabecera del Drawer
            UserAccountsDrawerHeader(
              accountName: Text("Usuario"),
              accountEmail: Text("usuario@email.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person, size: 40),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // Opciones del menú
            ListTile(
              leading: Icon(Icons.table_chart),
              title: Text('Mesas Disponibles'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MesasScreen()),
                );
              },
            ),
            if (role == 'admin') // Opciones exclusivas para el admin
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Gestionar Mesas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CrudMesasScreen()),
                  );
                },
              ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context); // Cerrar el Drawer
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bienvenido a Gestión de Reservas'),
      ),
    );
  }
}

// Ejemplo de pantalla de mesas
class MesasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesas Disponibles'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán las mesas disponibles'),
      ),
    );
  }
}

// Ejemplo de pantalla de CRUD de mesas
class CrudMesasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar Mesas'),
      ),
      body: Center(
        child: Text('Aquí estará el CRUD de mesas'),
      ),
    );
  }
}
