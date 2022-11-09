import 'package:app_aula/containers/contato/editar_contato.dart';
import 'package:app_aula/containers/contato/novo_contato.dart';
import 'package:app_aula/helper/contato_helper.dart';
import 'package:app_aula/model/contato.dart';
import 'package:flutter/material.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key, required this.title});

  final String title;

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  ContatoHelper helper = ContatoHelper();
  List<Contato> contatos = <Contato>[];

  getAllContacts() {
    helper.initDb().then((value) {
      helper.obterTodos().then((value) {
        setState(() {
          contatos = value;
        });
      });
      helper.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //List View
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          scrollDirection: Axis.vertical,
          children: [
            for (var contato in contatos)
              Card(
                child: ListTile(
                  title: Text(contato.nome),
                  subtitle: Text(contato.email),
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, '/editar_contato',
                        arguments: contato);
                  },
                ),
              ),
            //icone de person, nome, email e celular
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Nome: Ranielli'),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Email: teste@gmail.com'),
                    Text('Celular: 9999999999')
                  ]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditarContatoPage(
                            title: 'Editar contato',
                            contato: Contato(
                                id: '1',
                                nome: 'Ranielli',
                                email: 'teste@gmail.com',
                                celular: '9999999999'))));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const NovoContatoPage(title: 'Novo contato');
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
