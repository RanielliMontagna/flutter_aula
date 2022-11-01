import 'package:app_aula/model/imc.dart';
import 'package:app_aula/util/dialogs.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key, required this.title});

  final String title;

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  Imc obj = Imc();
  final List<Imc> entries = <Imc>[];
  final List<int> colorCodes = <int>[600, 100];

  void _calcularImc() {
    Dialogs.showAlertDialog(context, obj.getResultado());
    setState(() {
      entries.add(Imc.iniAll(obj.nome, obj.altura, obj.peso));
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
                    obj.nome = value;
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
                  obj.peso = double.parse(value);
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
                  obj.altura = double.parse(value);
                  return null;
                },
              ),
            ),
            if (obj.getImc() != 0) Text(obj.getResultado()),
            SizedBox(
              height: 200,
              width: 300,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index % 2 > 0 ? 0 : 1]],
                    child: Center(child: Text(entries[index].nome)),
                  );
                },
              ),
            ),
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
