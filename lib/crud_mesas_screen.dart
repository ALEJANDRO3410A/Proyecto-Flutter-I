import 'package:flutter/material.dart';
import 'mis_reservas_screen.dart';

class CrudMesasScreen extends StatefulWidget {
  @override
  _CrudMesasScreenState createState() => _CrudMesasScreenState();
}

class _CrudMesasScreenState extends State<CrudMesasScreen> {
  List<Map<String, dynamic>> mesas = [
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    {"id": 1, "nombre": "Mesa 1", "disponible": true},
    {"id": 2, "nombre": "Mesa 2", "disponible": false},
    {"id": 3, "nombre": "Mesa 3", "disponible": true},
    
  ];

  List<Map<String, dynamic>> reservas = [];

  void _showReservationDialog(BuildContext context, Map<String, dynamic> mesa) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    final TextEditingController notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Reservar ${mesa['nombre']}'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Nombre del Reservante",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: timeController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Hora de la Reserva",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      timeController.text = pickedTime.format(context);
                    }
                  },
                ),
                SizedBox(height: 15),
                TextField(
                  controller: notesController,
                  decoration: InputDecoration(
                    labelText: "Agregados (opcional)",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    timeController.text.isNotEmpty) {
                  setState(() {
                    mesa['disponible'] = false;
                    reservas.add({
                      "numeroMesa": mesa['nombre'],
                      "nombreReservante": nameController.text,
                      "horaReserva": timeController.text,
                      "agregados": notesController.text,
                    });
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Reservado con éxito")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Por favor, completa los campos obligatorios"),
                    ),
                  );
                }
              },
              child: Text("Reservar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestión de Mesas"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                "Menú Principal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.table_chart),
              title: Text("Gestión de Mesas"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.event_seat),
              title: Text("Mis Reservas"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MisReservasScreen(reservas: reservas),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Cerrar Sesión"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Imagen con capacidad de zoom en la parte superior
          InteractiveViewer(
            child: Image.asset(
              'images/Restaurante.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.contain, // Para asegurar que toda la imagen se vea
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: mesas.map((mesa) {
                  return Card(
                    color: mesa['disponible'] ? Colors.green[100] : Colors.red[100],
                    child: ListTile(
                      title: Text(mesa['nombre']),
                      subtitle: Text(
                        mesa['disponible'] ? "Disponible" : "No Disponible",
                        style: TextStyle(
                          color: mesa['disponible'] ? Colors.green : Colors.red,
                        ),
                      ),
                      trailing: mesa['disponible']
                          ? ElevatedButton(
                              onPressed: () => _showReservationDialog(context, mesa),
                              child: Text("Reservar"),
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
