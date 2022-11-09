class Contato {
  String id;
  String nome;
  String email;
  String celular;

  Contato({this.id = '', this.nome = '', this.email = '', this.celular = ''});
  Contato.init(this.id, this.nome, this.email, this.celular);

  factory Contato.fromMap(Map<String, dynamic> json) {
    return Contato.init(
        json['_id'].toString(), json['nome'], json['email'], json['celular']);
  }

  Map<String, dynamic> toMap() => {
        '_id': id == null ? null : id,
        'nome': nome,
        'email': email,
        'celular': celular,
      };
}
