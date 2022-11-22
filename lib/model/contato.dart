class Contato {
  late int? _id;
  late String _nome;
  late String _email;
  late String _telefone;

  Contato() {
    _id = 0;
    _nome = "";
    _email = "";
    _telefone = "";
  }

  Contato.iniciar(this._nome, this._email, this._telefone);

  Contato.fromMap(Map map) {
    _id = map["idCol"];
    _nome = map["nomeCol"];
    _email = map["emailCol"];
    _telefone = map["telefoneCol"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idCol": _id,
      "nomeCol": _nome,
      "emailCol": _email,
      "telefoneCol": _telefone,
    };
    return map;
  }

  int? get id {
    return _id;
  }

  set id(int? id) {
    _id = id;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  String get email => _email;

  set email(String email) {
    _email = email;
  }

  String get telefone => _telefone;

  set telefone(String telefone) {
    _telefone = telefone;
  }

  @override
  toString() {
    return '$_nome - $_email';
  }

  bool operator ==(other) {
    return (other is Contato && other.id == _id);
  }
}
