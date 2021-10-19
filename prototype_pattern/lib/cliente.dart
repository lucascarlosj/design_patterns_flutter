import 'package:prototype_pattern/i_prototype.dart';
import 'package:prototype_pattern/telefone.dart';

class Cliente implements IPrototype<Cliente> {
  String? nome;
  DateTime? dataNacimento;
  String? _cpf;
  List<Telefone> telefones = [];

  Cliente._();

  factory Cliente() {
    var c = Cliente._();
    c.nome = 'Lucas Carlos';
    c.dataNacimento = DateTime.now();
    c._cpf = '21312312312';
    c.telefones = [
      Telefone(telefone: '(51)99999-9999'),
      Telefone(telefone: '(51)98888-8888')
    ];
    return c;
  }

  @override
  Cliente clone() {
    var c = Cliente();
    c.nome = nome;
    c.dataNacimento = dataNacimento;
    c._cpf = _cpf;
    c.telefones = [...telefones];
    return c;
  }

  @override
  String toString() {
    return "Cliente(nome: $nome, dataNascimento: $dataNacimento, cpf: $_cpf, telefones: $telefones)";
  }
}
