class Imc {
  // Atributos
  late String _nome = '';
  late double _peso = 0;
  late double _altura = 0;

  // Construtores
  Imc();
  Imc.iniAll(this._nome, this._peso, this._altura);
  Imc.iniNome(String nome) {
    this._nome = nome;
    this._peso = 0;
    this._altura = 0;
  }

  // Métodos
  double getImc() {
    if (_altura == 0) {
      return 0;
    }

    if (_peso == 0) {
      return 0;
    }

    return _peso / (_altura * _altura);
  }

  String getResultado() {
    return '$_nome, seu IMC é ${getImc().toStringAsFixed(2)}';
  }

  // getters and setters
  String get nome {
    return _nome;
  }

  set nome(String nome) {
    _nome = nome;
  }

  double get peso {
    return _peso;
  }

  set peso(double peso) {
    _peso = peso;
  }

  double get altura {
    return _altura;
  }

  set altura(double altura) {
    _altura = altura;
  }
}
