import 'package:app_aula/model/DiasVividos.dart';
import 'package:app_aula/util/dialogs.dart';
import 'package:flutter/material.dart';

class DiasVividosOoPage extends StatefulWidget {
  const DiasVividosOoPage({super.key, required this.title});

  final String title;

  @override
  State<DiasVividosOoPage> createState() => _DiasVividosOoPageState();
}

class _DiasVividosOoPageState extends State<DiasVividosOoPage> {
  DiasVividos obj = DiasVividos();
  final List<DiasVividos> entries = <DiasVividos>[];
  final List<int> colorCodes = <int>[600, 100];

  void _calcularIdade() {
    Dialogs.showAlertDialog(context, obj.getResultado());
    setState(() {
      entries.add(DiasVividos.iniAll(obj.nome, obj.idade));
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
                    obj.idade = int.parse(value);
                    return null;
                  },
                ),
              ),
              //mostrar resultado
              if (obj.getDiasVividos() > 0)
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    obj.getResultado(),
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
                  key: Key(obj.getDiasVividos().toString()),
                  initialValue: obj.getDiasVividos().toString(),
                ),
              ),
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
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            FocusScope.of(context).unfocus();
            Dialogs.showConfirmDialog(
                context,
                'Você tem certeza que deseja calcular a idade?',
                _calcularIdade);
          }
        },
        tooltip: 'Calcular',
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
