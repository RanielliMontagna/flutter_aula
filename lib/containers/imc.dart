import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key, required this.title});

  final String title;

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  String _nome = '';
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;

  void _calcularImc() {
    setState(() {
      _imc = _peso / (_altura * _altura);
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                  labelText: 'Peso',
                  hintText: 'Insira o seu peso',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu peso!';
                  }
                  _peso = double.parse(value);
                  return null;
                },
              ),
            ),
            Padding(
              //padding horizontal
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Altura',
                  hintText: 'Insira a sua altura',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a sua altura!';
                  }
                  _altura = double.parse(value);
                  return null;
                },
              ),
            ),
            if (_imc != 0) Text('$_nome tem IMC de $_imc'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            FocusScope.of(context).unfocus();
            _calcularImc();
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
