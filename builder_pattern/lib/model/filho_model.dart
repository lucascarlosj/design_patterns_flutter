class FilhoModel {
  final String nome;
  final int idade;
  
  FilhoModel({
    required this.nome,
    required this.idade,
  });

  @override
  String toString() => 'FilhoModel(nome: $nome, idade: $idade)';
}
