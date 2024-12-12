import 'package:flutter/material.dart';

class MisReservasScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reservas;

  MisReservasScreen({required this.reservas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Reservas"),
      ),
      body: reservas.isEmpty
          ? Center(
              child: Text(
                "No tienes reservas aún.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: reservas.length,
              itemBuilder: (context, index) {
                final reserva = reservas[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(Icons.event_seat, size: 40),
                    title: Text("Mesa: ${reserva['numeroMesa']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reservado para: ${reserva['nombreReservante']}"),
                        Text("Hora: ${reserva['horaReserva']}"),
                        if (reserva['agregados'] != null &&
                            reserva['agregados'].isNotEmpty)
                          Text("Descripción: ${reserva['agregados']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
