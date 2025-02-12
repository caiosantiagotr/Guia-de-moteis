// lib/providers/motel_provider.dart
import 'package:flutter/material.dart';
import 'package:guia_de_moteis/models/motel.dart';
import 'package:guia_de_moteis/services/motel_service.dart';

class MotelProvider with ChangeNotifier {
  List<Motel> _motels = [];
  bool _loading = true;
  String _errorMessage = '';

  List<Motel> get motels => _motels;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  // Método para buscar motéis
  Future<void> fetchMotels() async {
    _loading = true;
    notifyListeners();

    try {
      _motels = await MotelService().fetchMotels();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
