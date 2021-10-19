import 'package:flutter/material.dart';
import 'package:singleton_pattern/database/connection.dart';

class SingletonPattern extends StatefulWidget {
  const SingletonPattern({Key? key}) : super(key: key);

  @override
  _SingletonPatternState createState() => _SingletonPatternState();
}

class _SingletonPatternState extends State<SingletonPattern> {
  List nomes = [];

  @override
  void initState() {
    super.initState();
    buscarNomes();
    /*  int i = 0;
    while (i < 10) {
      print(SingletonRaiz.instance.id);
      print(SingletonFactory().id);
      i++;
    } */
  }

  

  Future<void> buscarNomes() async {
    var db = await Connection.instance.db;
    var result = await db.rawQuery('select * from teste');
    setState(() {
      nomes = result.map((e) => e['nome']).toList();
    });
  }

  @override
  void dispose() {
    Connection.instance.closeConnection();
    super.dispose();
  }

  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singleton'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var db = await Connection.instance.db;
          db.rawInsert('insert into teste values("${text.text}")');
          buscarNomes();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          TextField(controller: text),
          Expanded(
            child: ListView.builder(
              itemCount: nomes.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(
                  nomes[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
