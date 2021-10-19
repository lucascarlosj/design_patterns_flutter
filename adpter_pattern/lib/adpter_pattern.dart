import 'package:adpter_pattern/endereco_model.dart';
import 'package:adpter_pattern/xml_to_json_adpter.dart';
import 'package:dio/dio.dart';

Future<void> run() async {
  var endereco = await Dio()
      .get('https://viacep.com.br/ws/01001000/json/')
      .then((res) => Endereco.fromMap(res.data));

  print(endereco);
  print('#####################################');
  print('XML');
  var res = await Dio()
      .get('https://viacep.com.br/ws/01001000/xml/')
      .then((res) => XmlToJsonAdpter.adpter(res.data))
      .then((res) => Endereco.fromMap(res['xmlcep']));
  print(res);
}
