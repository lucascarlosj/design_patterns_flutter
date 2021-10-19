import 'package:builder_pattern/builders/funcionario_builder.dart';
import 'package:builder_pattern/builders/funcionario_builder_complexo.dart';
import 'package:builder_pattern/dio/custom_dio_builder.dart';
import 'package:builder_pattern/model/filho_model.dart';

Future<void> execute() async {
  var funcionario1 = FuncionarioBuilder.instance
      .nome('Lucas Carlos')
      .idade(23)
      .profissao('Desenvolvedor')
      .addFilho(FilhoModel(nome: 'Miguelito', idade: 12))
      .addFilho(FilhoModel(nome: 'Rafaelito', idade: 10))
      .build();

  print(funcionario1);

  var funcionario2 = FuncionarioBuilderComplexo.instance
      .nome('Lucas Carlos')
      .idade(23)
      .profissao('Desenvolvedor Mobile')
      .addFilho(FilhoModel(nome: 'Miguelito', idade: 12))
      .build();

  print(funcionario2);

  print('##################################################################');
  print('post');

  var resultPost = await CustomDioBuilder.instance
      .post()
      .path('https://jsonplaceholder.typicode.com/posts')
      .addHeader('Content-type', 'application/json')
      .params()
      .data({'title': 'Titulo X', 'body': 'BodyX', 'userId': 1}).run();

  print(resultPost.data);

  print('##################################################################');
  print('Get com QueryParameters');

  var resultGet = await CustomDioBuilder.instance
      .get()
      .path('https://jsonplaceholder.typicode.com/posts')
      .params()
      .queryParameters()
      .addQueryParam('userId', 1)
      .run();

  print(resultGet.data);
  print('##################################################################');
  print('Get com QueryParameters');
}
