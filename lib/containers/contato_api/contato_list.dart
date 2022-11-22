import 'package:app_aula/containers/contato_api/contato_edit.dart';
import 'package:app_aula/domain/contato.dart';
import 'package:app_aula/helper/contato_helper_api.dart';
import 'package:app_aula/util/dialogs.dart';
import 'package:flutter/material.dart';

class ContatosApiPage extends StatefulWidget {
  const ContatosApiPage({super.key, this.title});
  final String? title;

  @override
  State<ContatosApiPage> createState() => _ContatosApiPageState();
}

class _ContatosApiPageState extends State<ContatosApiPage> {
  final contatosDb = ContatoHelperApi();
  List<Contato> contatos = List.empty();
  Contato? selecionado;

  void _getAllContacts() {
    contatosDb.obterTodos().then((list) {
      setState(() {
        contatos = list.cast<Contato>();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllContacts();
  }

  selecionar(int selecao) {
    selecionado = contatos[selecao];
    _showContactPage();
  }

  void _incluir() {
    selecionado = Contato();
    _showContactPage();
  }

  void _showContactPage() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContatosEditPage(
                  selecionado: selecionado,
                )));
    if (result != null) {
      if (result == 'Salvar') {
        if (selecionado!.id == 0) {
          contatosDb.inserir(selecionado!).then((res) {
            Dialogs.showAlertDialog(context, 'Dados inseridos com sucesso!');
          });
        } else {
          contatosDb.alterar(selecionado!).then((_) {
            _getAllContacts();
            Dialogs.showAlertDialog(context, 'Dados alterados com sucesso!');
          });
        }
      } else if (result == 'Excluir') {
        contatosDb.excluir(selecionado!.id!).then((_) {
          _getAllContacts();
          Dialogs.showAlertDialog(context, 'Dados excluídos com sucesso!');
        });
      } else if (result == 'Cancelar') {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: contatos.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(children: <Widget>[
                  Text('${contatos[index].id}'),
                  const SizedBox(width: 20),
                  Text(contatos[index].nome as String),
                ]),
                onTap: () => selecionar(index),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incluir,
        tooltip: 'incluir',
        child: const Icon(Icons.add),
      ),
    );
  }
}
