class Contato {
  String? id;
  String? nome;
  String? email;
  String? telefone;
  Contato() {
    id = null;
    nome = "";
    email = "";
    telefone = "";
  }
  Contato.init(this.id, this.nome, this.email, this.telefone);
  // do json para o objeto
  factory Contato.fromMap(Map<String, dynamic> json) {
    return Contato.init(
        json['_id'], json['nome'], json['email'], json['telefone']);
  }
  // do objeto para json
  Map<String, dynamic> toMap() =>
      {'_id': id, 'nome': nome, 'email': email, 'telefone': telefone};
}
