import 'package:prototype_pattern/cliente.dart';

void run() {
  var cli1 = Cliente();

  var cli2 = cli1.clone();

  print(cli1.hashCode);
  print(cli2.hashCode);

  print(cli1);
  print(cli2);

  print('#################');
  cli2.telefones.removeAt(0);

  print(cli1);
  print(cli2);
}
