import 'dart:convert';

class Endereco {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  Endereco({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
  });


  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) => Endereco.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Endereco(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade)';
  }
}
