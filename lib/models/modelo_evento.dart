import 'package:flutter/material.dart';

class EventModel {
  final String description;
  final DateTime date;

  EventModel({required this.description, required this.date});
}

class EventProvider with ChangeNotifier {
  final List<EventModel> _events = [];

  List<EventModel> get events => _events;

  void addEvent(String description, DateTime date) {
    final newEvent = EventModel(description: description, date: date);
    _events.add(newEvent);
    notifyListeners();
  }

  void removeEvent(EventModel event) {
    _events.remove(event);
    notifyListeners();
  }
}
