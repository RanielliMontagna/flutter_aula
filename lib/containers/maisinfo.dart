import 'package:flutter/material.dart';

class MaisInfoPage extends StatelessWidget {
  final String valor;
  const MaisInfoPage({Key? key, required this.valor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mais Informações'),
      ),
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Text(valor),
        ),
      ),
    );
  }
}
