import 'package:flutter/material.dart';
import 'crud_mesas_screen.dart'; // Importa la pantalla CRUD
import 'registro.dart'; // Importa la pantalla de registro

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  void _login() {
    // Simular lógica de validación
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      // Redirigir al CRUD (Administrador)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CrudMesasScreen()),
      );
    } else {
      // Mostrar un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingresa tus credenciales"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bienvenido al restaurante 'Pollito'",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    Text("Recuérdame"),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text("Iniciar Sesión"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navegar a la pantalla de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroScreen()),
                    );
                  },
                  child: Text(
                    "¿No tienes cuenta? Regístrate aquí",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
