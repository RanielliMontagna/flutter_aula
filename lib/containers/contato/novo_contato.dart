import 'package:app_aula/helper/contato_helper.dart';
import 'package:app_aula/model/contato.dart';
import 'package:flutter/material.dart';

class NovoContatoPage extends StatefulWidget {
  const NovoContatoPage({super.key, required this.title});

  final String title;

  @override
  State<NovoContatoPage> createState() => _NovoContatoPageState();
}

class _NovoContatoPageState extends State<NovoContatoPage> {
  ContatoHelper helper = ContatoHelper();
  Contato contato = Contato();
  final _formKey = GlobalKey<FormState>();

  void _salvarContato() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      helper.inserir(contato);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Formulario de novo contato
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
                      hintText: 'Insira o nome',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome!';
                      }
                      contato.nome = value;
                      return null;
                    },
                  )),
              Padding(
                //padding horizontal
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Insira o email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o email!';
                    }
                    contato.email = value;
                    return null;
                  },
                ),
              ),
              Padding(
                //padding horizontal
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Celular',
                    hintText: 'Insira o celular',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o celular!';
                    }
                    contato.celular = value;
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    onPressed: _salvarContato,
                    child: const Text('Salvar'),
                  ),
                ),
              ),
            ],
          )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
