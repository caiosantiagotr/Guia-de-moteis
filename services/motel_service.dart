// lib/services/motel_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guia_de_moteis/models/motel.dart';

class MotelService {
  // URL da API
  static const String apiUrl = 'https://www.guiademoteis.com.br/rio-de-janeiro';

  Future<List<Motel>> fetchMotels() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Se a resposta for bem-sucedida, decodifica o JSON
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Motel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os motéis');
    }
  }
}
