import 'package:flutter/material.dart';
import 'package:practica4_app/models/modelo_evento.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  final EventModel event;

  const EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(event.description),
        subtitle: Text(event.date.toLocal().toString().split(' ')[0]),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            Provider.of<EventProvider>(context, listen: false)
                .removeEvent(event);
          },
        ),
      ),
    );
  }
}
