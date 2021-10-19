import 'package:factory_method/factories/dialog_action.dart';
import 'package:factory_method/factories/dialog_factory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: DialogFactory.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openDialog() {
    DialogFactory.showAlertDialog(
      title: const Text('Titulo X'),
      content: const Text('Conteudo X'),
      actions: [
        DialogAction(
          child: const Text('Sim'),
          onPressed: () => print('Sim'),
        ),
        DialogAction(
          child: const Text('Não'),
          onPressed: () => print('Não'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openDialog,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
