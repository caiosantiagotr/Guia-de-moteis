// lib/screens/motel_list_screen.dart
import 'package:flutter/material.dart';
import '../providers/motel_provider.dart';
import 'package:provider/provider.dart';

class MotelListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final motelProvider = Provider.of<MotelProvider>(context);

    // Chama a função para buscar os motéis assim que a tela for carregada
    if (motelProvider.motels.isEmpty) {
      motelProvider.fetchMotels();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ir Agora'),
      ),
      body: motelProvider.loading
          ? Center(child: CircularProgressIndicator()) // Exibe o indicador de carregamento
          : motelProvider.errorMessage.isNotEmpty
              ? Center(child: Text(motelProvider.errorMessage))
              : ListView.builder(
                  itemCount: motelProvider.motels.length,
                  itemBuilder: (context, index) {
                    final motel = motelProvider.motels[index];
                    return ListTile(
                      title: Text(motel.name),
                      subtitle: Text(motel.price),
                      leading: Image.network(motel.imageUrl),
                    );
                  },
                ),
    );
  }
}
