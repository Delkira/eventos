import 'package:flutter/material.dart';
import 'package:practica4_app/models/modelo_evento.dart';
import 'package:practica4_app/screens/add_evento.dart';
import 'package:practica4_app/widgets/item_evento.dart';
import 'package:provider/provider.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Eventos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddEventScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<EventProvider>(
        builder: (context, eventProvider, child) {
          return ListView.builder(
            itemCount: eventProvider.events.length,
            itemBuilder: (context, index) {
              final event = eventProvider.events[index];
              return EventItem(event: event);
            },
          );
        },
      ),
    );
  }
}
