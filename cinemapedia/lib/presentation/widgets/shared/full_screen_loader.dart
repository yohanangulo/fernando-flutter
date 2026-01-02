import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  static final List<String> _messages = [
    'Cargando películas',
    'Comprando palomitas de maiz',
    'Cargando populares',
    'Llamando a mi novia',
    'Ya mero...',
    'Esto esta tardando mas de lo esperado :(',
  ];

  Stream<String> get _streamMessages {
    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (step) => _messages[step],
    ).take(_messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 10),
          StreamBuilder(
            stream: _streamMessages,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
