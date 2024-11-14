import 'package:flutter/material.dart';
import 'package:practica4_app/models/modelo_evento.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _saveEvent() {
    if (_descriptionController.text.isNotEmpty && _selectedDate != null) {
      final description = _descriptionController.text;
      final date = _selectedDate!;
      Provider.of<EventProvider>(context, listen: false)
          .addEvent(description, date);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Evento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  _selectedDate == null
                      ? 'Seleccione una fecha'
                      : 'Fecha: ${_selectedDate!.toLocal()}'.split(' ')[0],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Seleccionar Fecha'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveEvent,
              child: const Text('Guardar Evento'),
            ),
          ],
        ),
      ),
    );
  }
}
