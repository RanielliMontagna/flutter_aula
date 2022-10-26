import 'package:flutter/material.dart';

class DiasVividosPage extends StatefulWidget {
  const DiasVividosPage({super.key, required this.title});

  final String title;

  @override
  State<DiasVividosPage> createState() => _DiasVividosPageState();
}

class _DiasVividosPageState extends State<DiasVividosPage> {
  int _idade = 0;
  String _nome = '';
  int _diasVividos = 0;

  void _calcularIdade() {
    setState(() {
      _diasVividos = _idade * 365;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(32),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      hintText: 'Insira o seu nome',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o seu nome!';
                      }
                      _nome = value;
                      return null;
                    },
                  )),
              Padding(
                //padding horizontal
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Idade',
                    hintText: 'Insira a sua idade',
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor informe a idade!';
                    }
                    _idade = int.parse(value);
                    return null;
                  },
                ),
              ),
              //mostrar resultado
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  '$_nome, você já viveu $_diasVividos dias!',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Resultado',
                  ),
                  // usar key para detectar setState
                  key: Key(_diasVividos.toString()),
                  initialValue: _diasVividos.toString(),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            FocusScope.of(context).unfocus();
            _calcularIdade();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Calculado com sucesso!')),
            );
          }
        },
        tooltip: 'Calcular',
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
