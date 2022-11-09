import 'package:app_aula/helper/contato_helper.dart';
import 'package:app_aula/model/contato.dart';
import 'package:flutter/material.dart';

class EditarContatoPage extends StatefulWidget {
  const EditarContatoPage(
      {super.key, required this.title, required this.contato});

  final String title;
  final Contato contato;

  @override
  State<EditarContatoPage> createState() => _EditarContatoPageState();
}

class _EditarContatoPageState extends State<EditarContatoPage> {
  ContatoHelper helper = ContatoHelper();

  final _formKey = GlobalKey<FormState>();

  void _alterarContato() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      helper.alterar(widget.contato);
    }
    Navigator.pop(context);
  }

  void _excluirContato() {
    helper.excluir(widget.contato);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Formulario de Editar contato
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
                    initialValue: widget.contato.nome,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome!';
                      }
                      widget.contato.nome = value;
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
                  initialValue: widget.contato.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o email!';
                    }
                    widget.contato.email = value;
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
                  initialValue: widget.contato.celular,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o celular!';
                    }
                    widget.contato.celular = value;
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    onPressed: _alterarContato,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Alterar'),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    onPressed: _excluirContato,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Excluir'),
                  ),
                ),
              ),
            ],
          )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
