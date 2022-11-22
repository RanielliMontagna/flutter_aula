import 'dart:convert';
import 'package:app_aula/domain/contato.dart';
import 'package:http/http.dart' as http;

class ContatoHelperApi {
  String uri = "http://localhost:3000";
  Future<List<Contato>> obterTodos() async {
    final res = await http.get(Uri.parse('$uri/contato'));
    if (res.statusCode == 200) {
      List jsonList = json.decode(res.body);
      List<Contato> listContact = List.empty(growable: true);
      for (Map<String, dynamic> m in jsonList) {
        Contato c = Contato.fromMap(m);
        listContact.add(c);
      }
      return listContact;
    } else {
      throw Exception('Erro ao recuperar os objetos.');
    }
  }

  Future<String?> inserir(Contato contact) async {
    final res = await http.post(Uri.parse('$uri/contato'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(contact.toMap()));
    return res.body;
  }

  Future<String?> alterar(Contato contact) async {
    final res = await http.put(Uri.parse('$uri/contato'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(contact.toMap()));
    return res.body;
  }

  Future<String?> excluir(String idDel) async {
    final res = await http.delete(Uri.parse('$uri/contato/$idDel'));
    return res.body;
  }

  Future<Contato> getObjeto(int idFind) async {
    final res = await http.get(Uri.parse('$uri/contato/$idFind'));
    if (res.statusCode == 200) {
      Contato c = Contato.fromMap(jsonDecode(res.body));
      return c;
    } else {
      throw Exception('Erro ao recuperar o objeto.');
    }
  }
}
